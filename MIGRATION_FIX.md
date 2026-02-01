# Migration Fix for Hive Data Error

## Issue
When updating from the old flat session structure to the new round-based structure, existing Hive data causes a crash:
```
type 'Null' is not a subtype of type 'List<dynamic>' in type cast
```

## Solution Implemented

Created a custom Hive adapter (`ArcherySessionAdapterMigration`) that safely handles missing fields from older data versions.

### What Changed
- Old structure: Sessions had `arrowCount`, `totalScore`, `shots` directly
- New structure: Sessions contain `rounds[]`, each with its own shots and stats
- Custom adapter provides default empty lists when fields don't exist

### Files Modified
1. **lib/models/archery_session_adapter.dart** (NEW)
   - Custom Hive adapter with null-safe field reading
   - Handles migration from old to new format

2. **lib/main.dart** (UPDATED)
   - Registers custom adapter instead of generated one
   - Registers ArcheryRoundAdapter for new model

## For Users with Existing Data

### Option 1: Clear Old Data (Recommended for Testing)
If you're testing and don't need to preserve old sessions:

**Android:**
```bash
# Stop the app first
flutter clean
# Clear app data on device: Settings > Apps > Quiver > Storage > Clear Data
flutter run
```

**Or via ADB:**
```bash
adb shell pm clear com.quiver.quiver
flutter run
```

### Option 2: Automatic Migration (Implemented)
The custom adapter automatically handles the migration:
- Old sessions load with empty `rounds` list
- Deprecated fields (`arrowCount`, `totalScore`, `shots`) are preserved
- New sessions save in the new round-based format

## Testing the Fix

Run the app after this fix:
```bash
flutter run
```

The app should now:
1. ✅ Load without crashing
2. ✅ Display existing sessions (with 0 rounds)
3. ✅ Allow creating new sessions with rounds
4. ✅ Save and load round-based sessions correctly

## Migration Path

For users who want to convert old flat sessions to rounds:

1. Old sessions will show with 0 rounds
2. Users can manually add rounds and re-enter data
3. Or implement auto-migration: convert old `shots` → single "default" round

**Future Enhancement:** Add migration helper that:
```dart
// Pseudocode for auto-migration
if (session.rounds.isEmpty && session.shots.isNotEmpty) {
  final defaultRound = ArcheryRound(
    id: uuid.v4(),
    distance: 18, // default
    distanceUnit: 'm',
    targetType: 'wa10Ring80cm',
    shots: session.shots,
    arrowCount: session.arrowCount ?? session.shots.length,
    totalScore: session.totalScore ?? 0,
    // ...
  );
  session = session.copyWith(rounds: [defaultRound], shots: []);
}
```

## Status
✅ **FIXED** - Custom adapter handles migration safely
