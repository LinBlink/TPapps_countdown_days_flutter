/// Domain-wide enumerations.
///
/// The integer `index` of each value is persisted by Drift (see the type
/// converters in `data/local`), so **never reorder or remove existing values**
/// — only append. JSON (backup + API DTOs) serialises by `name` instead, which
/// is reorder-safe.
library;

/// Whether an event's date is expressed on the solar (Gregorian) or the
/// Chinese lunar (农历) calendar. Affects display and repeat semantics.
enum CalendarType { solar, lunar }

/// Count down to a future moment, or count up from a past one (正数日).
enum Direction { countdown, countup }

/// How an event recurs. `lunarYearly` rolls to the next occurrence of the same
/// lunar month/day; `yearly`/`monthly`/`weekly` use the solar calendar.
enum RepeatRule { none, weekly, monthly, yearly, lunarYearly }

/// The smallest unit shown in the live countdown display.
enum Precision { day, hour, minute, second, millisecond }

/// Local persistence sync state, used later by cloud sync. Present from day one
/// so enabling sync needs no schema migration.
enum SyncState { localOnly, synced, dirty, pendingDelete }

/// Ordering applied to the countdown list.
enum SortMode { date, created, name, manual }

/// User theme preference (maps to Cupertino brightness at the app root).
enum AppThemeMode { system, light, dark }

/// Language preference. `system` follows the device locale.
enum AppLocaleOption { system, zh, en }
