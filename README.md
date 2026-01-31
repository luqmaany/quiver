# Quiver 🎯

A modern, local-first archery practice logging application built with Flutter. Track your sessions, analyze your performance, and improve your skills.

## Features

### Phase 1 (Current) ✅
- **Local-First Storage**: Use the app immediately without signing up
- **Session Management**: Log practice sessions with arrow counts and scores
- **Statistics Tracking**: Automatic calculation of averages and totals
- **Modern UI**: Clean, Material Design 3 interface with dark mode support
- **No Auth Required**: Start tracking immediately, sign in later for cloud features

### Coming Soon
- **Phase 2**: Target visualization with drag-and-drop shot placement
- **Phase 3**: Voice notes with automatic transcription
- **Phase 4**: Cloud sync, leagues, and leaderboards (Duolingo-style competition)

## Architecture

```
┌─────────────────────────────────────┐
│         UI Layer (Screens)          │
├─────────────────────────────────────┤
│    Riverpod Providers (State)       │
├─────────────────────────────────────┤
│    Repositories (Data Access)       │
├─────────────────────────────────────┤
│  Hive (Local)    Firebase (Cloud)   │
│  [Primary]       [Optional Sync]    │
└─────────────────────────────────────┘
```

### Tech Stack

- **Framework**: Flutter 3.6+
- **State Management**: Riverpod 2.6
- **Local Storage**: Hive 2.2
- **Navigation**: go_router 14.6
- **Cloud Backend**: Firebase (Auth, Firestore) - Phase 4
- **Code Generation**: Freezed, JSON Serializable

## Getting Started

### Prerequisites

- Flutter SDK 3.6.1 or higher
- Dart SDK 3.6.1 or higher
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd quiver
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run code generation** (if needed)
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Project Structure

```
lib/
├── main.dart                    # App entry point, Hive initialization
├── app.dart                     # App configuration, routing, theming
├── models/                      # Data models (Freezed + Hive)
│   ├── user_profile.dart
│   ├── archery_session.dart
│   └── shot_position.dart
├── repositories/                # Data access layer
│   ├── local_session_repository.dart
│   └── user_repository.dart
├── providers/                   # Riverpod state management
│   ├── session_provider.dart
│   ├── user_provider.dart
│   └── auth_provider.dart
├── screens/                     # UI screens
│   ├── home/
│   ├── sessions/
│   └── settings/
└── widgets/                     # Reusable widgets
    └── common/
```

## Data Models

### UserProfile
- **Purpose**: Store user information and preferences
- **Fields**: `id`, `displayName`, `email`, `isPublic`, `createdAt`, `isSynced`
- **Future Fields**: `leagueTier`, `weeklyPoints`, `currentStreak`

### ArcherySession
- **Purpose**: Record practice sessions
- **Fields**: `id`, `ownerId`, `date`, `title`, `arrowCount`, `totalScore`, `averageScore`, `shots`, `createdAt`, `updatedAt`
- **Scoring**: Tracks total score and average per arrow for league calculations

### ShotPosition
- **Purpose**: Record individual arrow placements (Phase 2)
- **Fields**: `x`, `y` (normalized 0-1), `score`, `timestamp`

## Usage

### Creating a Session

1. Tap the **"New Session"** floating action button on the home screen
2. A new session is created with the current date/time
3. Enter session details (title, arrow count, total score)
4. Tap the checkmark to save

### Viewing Sessions

- Sessions are displayed on the home screen in reverse chronological order
- Tap a session card to view and edit details
- Swipe or tap the menu icon to delete a session

### Settings

- Update your display name and email
- Toggle public profile (for future league features)
- View app information and version

## Firebase Setup (Optional)

Cloud sync is **optional** and will be implemented in Phase 4. To prepare for it:

See [FIREBASE_SETUP.md](FIREBASE_SETUP.md) for detailed instructions.

**Note**: The app is fully functional without Firebase. All data is stored locally using Hive.

## Development

### Running Tests

```bash
flutter test
```

### Code Generation

When you modify models or add new Riverpod providers:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

This watches for changes and automatically regenerates code.

### Linting

```bash
flutter analyze
```

All code follows Flutter linting best practices with no warnings or errors.

## Roadmap

### ✅ Phase 1: Foundation (COMPLETE)
- [x] Project setup with dependencies
- [x] Data models (User, Session, Shot)
- [x] Local storage with Hive
- [x] Repositories for data access
- [x] Riverpod providers for state management
- [x] Navigation with go_router
- [x] Home screen with session list
- [x] Session detail screen
- [x] Settings screen
- [x] Firebase preparation

### 📋 Phase 2: Target Visualization
- [ ] Standard archery target image asset
- [ ] Interactive canvas for shot placement
- [ ] Drag-and-drop arrow icons
- [ ] Score calculation based on position
- [ ] Shot grouping analysis
- [ ] Session statistics visualization

### 🎤 Phase 3: Voice Notes
- [ ] Audio recording integration
- [ ] Voice note playback
- [ ] Speech-to-text transcription
- [ ] Note storage (local + cloud)
- [ ] Session note display

### ☁️ Phase 4: Cloud Sync & Leagues
- [ ] Firebase Authentication implementation
- [ ] Cloud Firestore sync
- [ ] Local-to-cloud data migration
- [ ] Weekly league system
- [ ] Leaderboards (Duolingo-style)
- [ ] League tiers (Bronze, Silver, Gold, Diamond)
- [ ] Promotion/demotion system
- [ ] Cloud Functions for score aggregation

## Future Features

- **Advanced Statistics**: Trends, improvement tracking, personal bests
- **Training Plans**: Guided practice routines
- **Equipment Tracking**: Log bow, arrows, and setup changes
- **Weather Integration**: Track environmental conditions
- **Social Features**: Share sessions, compare with friends
- **Achievements**: Badges and milestones

## Contributing

This is a personal project, but suggestions and feedback are welcome! Feel free to open issues for bugs or feature requests.

## License

[Add your license here]

## Acknowledgments

- Built with Flutter and Riverpod
- Inspired by Duolingo's gamification mechanics
- Target visualization coming from World Archery standards

---

**Current Version**: 1.0.0 - Phase 1
**Status**: Production Ready (Local Mode)
**Next Up**: Phase 2 - Target Visualization
