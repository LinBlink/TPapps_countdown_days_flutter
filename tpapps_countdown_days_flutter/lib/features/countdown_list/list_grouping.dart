import '../../core/time/recurrence.dart';
import '../../domain/enums.dart';
import '../../domain/models/countdown.dart';

enum CountdownGroup { pinned, upcoming, past }

class CountdownSection {
  const CountdownSection(this.group, this.items);
  final CountdownGroup group;
  final List<Countdown> items;
}

/// Filters by [query], then splits countdowns into pinned / upcoming / past and
/// sorts each section by [sort].
///
/// Upcoming-vs-past uses each event's *effective* target (a repeating event is
/// rolled forward), so recurring birthdays/anniversaries always read as
/// upcoming rather than sinking into the past section.
List<CountdownSection> groupCountdowns(
  List<Countdown> items, {
  required DateTime now,
  required SortMode sort,
  String query = '',
}) {
  final q = query.trim().toLowerCase();
  final filtered = q.isEmpty
      ? items
      : items
          .where((c) =>
              c.title.toLowerCase().contains(q) ||
              (c.note?.toLowerCase().contains(q) ?? false))
          .toList();

  DateTime eff(Countdown c) => effectiveTarget(c, now);

  int byMode(Countdown a, Countdown b) => switch (sort) {
        SortMode.date => eff(a).compareTo(eff(b)),
        SortMode.created => b.createdAt.compareTo(a.createdAt),
        SortMode.name => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
        SortMode.manual => a.sortOrder.compareTo(b.sortOrder),
      };

  final pinned = <Countdown>[];
  final upcoming = <Countdown>[];
  final past = <Countdown>[];
  for (final c in filtered) {
    if (c.pinned) {
      pinned.add(c);
    } else if (eff(c).isBefore(now)) {
      past.add(c);
    } else {
      upcoming.add(c);
    }
  }
  pinned.sort(byMode);
  upcoming.sort(byMode);
  past.sort((a, b) => eff(b).compareTo(eff(a))); // most-recently passed first

  return [
    if (pinned.isNotEmpty) CountdownSection(CountdownGroup.pinned, pinned),
    if (upcoming.isNotEmpty) CountdownSection(CountdownGroup.upcoming, upcoming),
    if (past.isNotEmpty) CountdownSection(CountdownGroup.past, past),
  ];
}
