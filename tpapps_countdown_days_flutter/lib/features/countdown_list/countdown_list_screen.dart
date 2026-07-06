import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/enums.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers/repositories.dart';
import 'countdown_card.dart';
import 'list_grouping.dart';

class CountdownListScreen extends ConsumerStatefulWidget {
  const CountdownListScreen({super.key});

  @override
  ConsumerState<CountdownListScreen> createState() =>
      _CountdownListScreenState();
}

class _CountdownListScreenState extends ConsumerState<CountdownListScreen> {
  String _query = '';
  SortMode _sort = SortMode.date;

  Future<void> _pickSort(AppLocalizations l) async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (sheetContext) => CupertinoActionSheet(
        title: Text(l.sortBy),
        actions: [
          for (final mode in SortMode.values)
            CupertinoActionSheetAction(
              onPressed: () {
                setState(() => _sort = mode);
                Navigator.pop(sheetContext);
              },
              child: Text(_sortLabel(l, mode)),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(sheetContext),
          child: Text(l.actionCancel),
        ),
      ),
    );
  }

  Future<bool> _confirmDelete(AppLocalizations l) async {
    final ok = await showCupertinoDialog<bool>(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(l.deleteConfirmTitle),
        content: Text(l.deleteConfirmMessage),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(l.actionCancel),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(l.actionDelete),
          ),
        ],
      ),
    );
    return ok ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final async = ref.watch(countdownListProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => context.push('/settings'),
          child: const Icon(CupertinoIcons.gear),
        ),
        middle: Text(l.appTitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => _pickSort(l),
              child: const Icon(CupertinoIcons.sort_down),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => context.push('/new'),
              child: const Icon(CupertinoIcons.add),
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: CupertinoSearchTextField(
                placeholder: l.actionSearch,
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
            Expanded(
              child: async.when(
                loading: () =>
                    const Center(child: CupertinoActivityIndicator()),
                error: (e, _) => Center(child: Text('$e')),
                data: (items) {
                  final sections = groupCountdowns(
                    items,
                    now: DateTime.now(),
                    sort: _sort,
                    query: _query,
                  );
                  if (sections.isEmpty) {
                    return _query.isEmpty
                        ? _EmptyState(l: l)
                        : Center(
                            child: Text(
                              l.listEmptyTitle,
                              style: TextStyle(
                                color: CupertinoColors.secondaryLabel
                                    .resolveFrom(context),
                              ),
                            ),
                          );
                  }
                  return ListView(
                    padding: const EdgeInsets.only(bottom: 24),
                    children: [
                      for (final section in sections) ...[
                        _SectionHeader(text: _groupLabel(l, section.group)),
                        for (final c in section.items)
                          Dismissible(
                            key: ValueKey(c.id),
                            direction: DismissDirection.endToStart,
                            background: _deleteBackground(context),
                            confirmDismiss: (_) => _confirmDelete(l),
                            onDismissed: (_) => ref
                                .read(countdownRepositoryProvider)
                                .softDelete(c.id),
                            child: CountdownCard(
                              countdown: c,
                              onTap: () => context.push('/countdown/${c.id}'),
                            ),
                          ),
                      ],
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _deleteBackground(BuildContext context) => Container(
  alignment: Alignment.centerRight,
  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
  padding: const EdgeInsets.only(right: 24),
  decoration: BoxDecoration(
    color: CupertinoColors.destructiveRed,
    borderRadius: BorderRadius.circular(16),
  ),
  child: const Icon(CupertinoIcons.delete, color: CupertinoColors.white),
);

String _sortLabel(AppLocalizations l, SortMode mode) => switch (mode) {
  SortMode.date => l.sortDate,
  SortMode.created => l.sortCreated,
  SortMode.name => l.sortName,
  SortMode.manual => l.sortManual,
};

String _groupLabel(AppLocalizations l, CountdownGroup group) => switch (group) {
  CountdownGroup.pinned => l.sectionPinned,
  CountdownGroup.upcoming => l.sectionUpcoming,
  CountdownGroup.past => l.sectionPast,
};

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 6),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.l});

  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    final secondary = CupertinoColors.secondaryLabel.resolveFrom(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(CupertinoIcons.calendar, size: 64, color: secondary),
            const SizedBox(height: 16),
            Text(
              l.listEmptyTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              l.listEmptySubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: secondary),
            ),
            const SizedBox(height: 24),
            CupertinoButton.filled(
              onPressed: () => context.push('/new'),
              child: Text(l.newCountdown),
            ),
          ],
        ),
      ),
    );
  }
}
