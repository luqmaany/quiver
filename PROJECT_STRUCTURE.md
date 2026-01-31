# Project Structure Reference

Quick reference guide for navigating the Quiver codebase.

## Root Directory

```
quiver/
├── lib/                          # Main application code
├── test/                         # Unit and widget tests
├── android/                      # Android platform code
├── ios/                          # iOS platform code
├── web/                          # Web platform code
├── windows/                      # Windows platform code
├── linux/                        # Linux platform code
├── macos/                        # macOS platform code
├── pubspec.yaml                  # Dependencies and configuration
├── analysis_options.yaml         # Linting rules
├── README.md                     # Project documentation
├── GETTING_STARTED.md           # User guide
├── FIREBASE_SETUP.md            # Firebase configuration guide
├── CHANGELOG.md                 # Version history
└── PHASE1_SUMMARY.md            # Implementation summary
```

## lib/ Directory (Main Application)

```
lib/
├── main.dart                     # App entry point, Hive initialization
├── app.dart                      # MaterialApp, routing, theming
├── firebase_options.dart         # Firebase config (placeholder for Phase 4)
│
├── models/                       # Data models (Freezed + Hive)
│   ├── user_profile.dart         # User profile model
│   ├── user_profile.freezed.dart # Generated Freezed code
│   ├── user_profile.g.dart       # Generated Hive adapter
│   ├── archery_session.dart      # Session model
│   ├── archery_session.freezed.dart
│   ├── archery_session.g.dart
│   ├── shot_position.dart        # Shot placement model
│   ├── shot_position.freezed.dart
│   └── shot_position.g.dart
│
├── repositories/                 # Data access layer
│   ├── local_session_repository.dart  # Session CRUD with Hive
│   └── user_repository.dart           # User profile management
│
├── providers/                    # Riverpod state management
│   ├── session_provider.dart    # Session state and operations
│   ├── user_provider.dart       # User profile state
│   └── auth_provider.dart       # Auth state (placeholder)
│
├── screens/                      # UI screens
│   ├── home/
│   │   └── home_screen.dart     # Session list, main view
│   ├── sessions/
│   │   └── session_detail_screen.dart  # Edit session details
│   └── settings/
│       └── settings_screen.dart  # Profile and app settings
│
└── widgets/                      # Reusable widgets
    └── common/                   # Common UI components
        └── (empty - ready for Phase 2)
```

## Key Files Explained

### Entry Point
- **`main.dart`** - Initializes Hive, registers adapters, opens boxes, starts app

### App Configuration
- **`app.dart`** - Configures MaterialApp, defines routes, sets up themes

### Models (What data looks like)
- **`user_profile.dart`** - User info: id, name, email, public flag, sync status
- **`archery_session.dart`** - Session data: date, title, arrows, score, shots
- **`shot_position.dart`** - Individual arrow: x, y coordinates, score, timestamp

### Repositories (How to access data)
- **`local_session_repository.dart`** - Get, save, update, delete sessions from Hive
- **`user_repository.dart`** - Get and update user profile from Hive

### Providers (State management)
- **`session_provider.dart`** - Provides session list, single session, create/update/delete
- **`user_provider.dart`** - Provides current user, profile updates
- **`auth_provider.dart`** - Placeholder for Firebase auth (Phase 4)

### Screens (What users see)
- **`home_screen.dart`** - Main screen with session list and "New Session" button
- **`session_detail_screen.dart`** - View/edit individual session
- **`settings_screen.dart`** - Profile management, app settings

## Data Flow

```
User Interaction
      ↓
   Screen (Widget)
      ↓
   ref.watch/read (Riverpod)
      ↓
   Provider (State)
      ↓
   Repository (Data Access)
      ↓
   Hive (Local Storage)
```

## Example: Creating a Session

1. User taps "New Session" FAB → `home_screen.dart:_createNewSession()`
2. Calls → `ref.read(createSessionProvider).createNewSession()`
3. Helper creates session → `session_provider.dart:CreateSessionHelper`
4. Repository saves → `local_session_repository.dart:saveSession()`
5. Hive stores data → `sessionsBox.put(session.id, session)`
6. Provider refreshes → `SessionListNotifier.refresh()`
7. UI updates → `ref.watch(sessionListProvider)` rebuilds

## Adding New Features

### New Screen
1. Create file in `lib/screens/[feature]/[screen_name]_screen.dart`
2. Add route in `lib/app.dart` → `_router` GoRouter
3. Navigate using `context.go('/route')`

### New Model
1. Create file in `lib/models/[model_name].dart`
2. Define with `@freezed` and `@HiveType` annotations
3. Run `dart run build_runner build --delete-conflicting-outputs`
4. Register adapter in `main.dart`

### New Provider
1. Create file in `lib/providers/[feature]_provider.dart`
2. Define provider using Riverpod annotations or classes
3. Use `ref.watch()` in widgets to read state
4. Use `ref.read()` to trigger actions

### New Repository
1. Create file in `lib/repositories/[feature]_repository.dart`
2. Implement data access methods
3. Create provider for repository instance
4. Use in other providers for data operations

## Testing

```
test/
└── widget_test.dart              # Data model tests
```

### Running Tests
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test
flutter test test/widget_test.dart
```

## Code Generation

When you modify models or add Riverpod generators:

```bash
# One-time generation
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerate on changes)
dart run build_runner watch --delete-conflicting-outputs
```

## Common Locations

### To add a new dependency
→ `pubspec.yaml` (dependencies section)

### To change app name
→ `pubspec.yaml` (name field)

### To change app theme
→ `lib/app.dart` (_buildLightTheme() and _buildDarkTheme())

### To modify navigation
→ `lib/app.dart` (_router GoRouter routes)

### To change Hive box names
→ `lib/main.dart` (openBox calls)

### To add a new Hive model
→ `lib/models/` (create model, run build_runner, register adapter in main.dart)

### To modify session list behavior
→ `lib/providers/session_provider.dart` (SessionListNotifier)

### To add new session fields
→ `lib/models/archery_session.dart` (add field, run build_runner)

## Phase Roadmap Files

- **Phase 1 (Current)**: All files in lib/ except target/voice features
- **Phase 2 (Next)**: Will add `lib/screens/target/`, `lib/widgets/target/`
- **Phase 3 (Future)**: Will add `lib/services/voice_service.dart`, recording UI
- **Phase 4 (Future)**: Will populate `lib/repositories/cloud_*`, `lib/providers/auth_provider.dart`

## Quick Commands

```bash
# Get dependencies
flutter pub get

# Run app
flutter run

# Run tests
flutter test

# Check for issues
flutter analyze

# Format code
dart format lib/

# Generate code
dart run build_runner build --delete-conflicting-outputs

# Clean build
flutter clean
```

---

**Note**: Generated files (*.freezed.dart, *.g.dart) should not be edited manually. They are regenerated when you run build_runner.
