import 'package:flutter_test/flutter_test.dart';
import 'package:tpapps_countdown_days_flutter/domain/enums.dart';
import 'package:tpapps_countdown_days_flutter/domain/models/countdown.dart';
import 'package:tpapps_countdown_days_flutter/features/countdown_list/list_grouping.dart';

Countdown _c(
  String id, {
  required DateTime target,
  bool pinned = false,
  RepeatRule rule = RepeatRule.none,
  String title = 'Event',
  DateTime? created,
}) {
  final now = created ?? DateTime(2020);
  return Countdown(
    id: id,
    title: title,
    target: target,
    pinned: pinned,
    repeatRule: rule,
    createdAt: now,
    updatedAt: now,
  );
}

void main() {
  final now = DateTime(2026, 6, 1, 12);

  test('splits into pinned / upcoming / past', () {
    final sections = groupCountdowns(
      [
        _c('future', target: DateTime(2026, 12, 1)),
        _c('past', target: DateTime(2026, 1, 1)),
        _c('pinnedPast', target: DateTime(2025, 1, 1), pinned: true),
      ],
      now: now,
      sort: SortMode.date,
    );

    expect(sections.map((s) => s.group), [
      CountdownGroup.pinned,
      CountdownGroup.upcoming,
      CountdownGroup.past,
    ]);
    expect(sections[0].items.single.id, 'pinnedPast');
    expect(sections[1].items.single.id, 'future');
    expect(sections[2].items.single.id, 'past');
  });

  test('a repeating event stays upcoming even if its stored target passed', () {
    final sections = groupCountdowns(
      [_c('bday', target: DateTime(2026, 1, 10), rule: RepeatRule.yearly)],
      now: now,
      sort: SortMode.date,
    );
    expect(sections.single.group, CountdownGroup.upcoming);
  });

  test('query filters by title (case-insensitive)', () {
    final sections = groupCountdowns(
      [
        _c('a', target: DateTime(2026, 12, 1), title: 'Trip to Tokyo'),
        _c('b', target: DateTime(2026, 12, 2), title: 'Dentist'),
      ],
      now: now,
      sort: SortMode.date,
      query: 'tokyo',
    );
    expect(sections.single.items.single.id, 'a');
  });

  test('date sort orders upcoming by soonest first', () {
    final sections = groupCountdowns(
      [
        _c('later', target: DateTime(2026, 12, 1)),
        _c('sooner', target: DateTime(2026, 7, 1)),
      ],
      now: now,
      sort: SortMode.date,
    );
    expect(sections.single.items.map((c) => c.id), ['sooner', 'later']);
  });
}
