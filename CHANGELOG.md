# Changelog

All notable changes to the Quiver project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-01-31

### Added - Phase 1: Foundation ✅

#### Project Setup
- Initialized Flutter project with comprehensive dependency management
- Configured Material Design 3 with custom archery-themed color scheme
- Set up both light and dark theme support
- Implemented proper code generation with Freezed and JSON serialization
- Added comprehensive linting rules (zero warnings/errors)

#### Data Models
- **UserProfile**: Future-proofed model with league-ready fields
  - Local UUID or Firebase UID support
  - Display name for leaderboards
  - Public profile toggle for leagues
  - Sync status tracking
- **ArcherySession**: Comprehensive session tracking
  - Scoring fields (total, average) for league points
  - Shot position list (ready for Phase 2)
  - Voice note paths (ready for Phase 3)
  - Cloud sync status tracking
- **ShotPosition**: Normalized coordinate system for target placement
  - Prepared for Phase 2 drag-and-drop implementation

#### Local Storage
- Implemented Hive for fast, local-first data persistence
- Created type adapters for all models
- Automatic box initialization in main.dart
- Zero-configuration setup for users

#### Repositories
- **LocalSessionRepository**: Complete CRUD operations
  - Get all sessions (sorted by date)
  - Get single session by ID
  - Save/update sessions
  - Delete sessions
  - Query by date range
  - Filter unsynced sessions (for Phase 4)
- **UserRepository**: Local profile management
  - Auto-create profile on first launch
  - Update profile without re-authentication
  - Clean interface for Phase 4 cloud integration

#### State Management (Riverpod)
- **SessionProviders**: Complete session state management
  - List provider with auto-refresh
  - Single session provider (family)
  - Create session helper with user context
  - Update and delete operations
- **UserProviders**: User profile state
  - Current user provider
  - Profile notifier with update methods
  - Display name and email management
  - Public profile toggle
- **AuthProvider**: Placeholder for Phase 4
  - Ready for Firebase Auth integration
  - Clean interface for future cloud sync

#### Navigation
- go_router setup with clean routing
- **NO authentication gates** - all routes accessible immediately
- Routes implemented:
  - `/` - Home screen (session list)
  - `/session/:id` - Session detail/edit
  - `/settings` - Settings and profile
- Smooth navigation with proper back button handling

#### UI Screens
- **Home Screen**
  - Beautiful empty state for first-time users
  - Session list with cards showing key stats
  - Floating action button for quick session creation
  - Delete confirmation dialogs
  - Bottom sheet options menu
- **Session Detail Screen**
  - Date display with calendar icon
  - Editable title, arrow count, and score fields
  - Real-time average calculation
  - Statistics card with visual icons
  - Phase 2 placeholder for target visualization
  - Auto-save on back navigation
- **Settings Screen**
  - User profile display with avatar
  - Display name and email editing
  - Public profile toggle (for leagues)
  - Cloud sync status indicator
  - "Sign in to Sync" call-to-action (Phase 4)
  - Version and about information

#### User Experience
- Immediate app usage (no sign-up required)
- Intuitive Material Design 3 components
- Smooth animations and transitions
- Helpful empty states
- Clear call-to-actions
- Confirmation dialogs for destructive actions
- Success feedback with snackbars

#### Developer Experience
- Clean project structure following best practices
- Comprehensive documentation in README
- Firebase setup guide (FIREBASE_SETUP.md)
- Full test coverage of data models
- Zero linting errors or warnings
- Type-safe code throughout
- Easy-to-extend architecture

#### Future-Proofing
- Data models ready for league scoring system
- Firestore structure documented and planned
- Optional auth framework in place
- Local-to-cloud migration path designed
- Sync status tracking on all entities
- Public profile toggle for leaderboards

### Technical Details

#### Dependencies
- `flutter_riverpod: ^2.6.1` - State management
- `hive: ^2.2.3` - Local database
- `hive_flutter: ^1.1.0` - Hive Flutter integration
- `go_router: ^14.6.2` - Declarative routing
- `freezed: ^2.5.7` - Immutable models
- `json_serializable: ^6.8.0` - JSON serialization
- `uuid: ^4.5.1` - ID generation
- `intl: ^0.19.0` - Date formatting
- `firebase_core: ^3.8.1` - Firebase SDK (ready for Phase 4)
- `firebase_auth: ^5.3.4` - Auth (ready for Phase 4)
- `cloud_firestore: ^5.5.2` - Database (ready for Phase 4)

#### Architecture Decisions
1. **Local-First**: Hive as primary storage, Firebase as optional sync layer
2. **No Auth Gates**: Allow immediate usage, encourage sign-in for cloud features
3. **Future-Proof Models**: Include fields for leagues/leaderboards now
4. **Clean Separation**: Repositories abstract storage implementation
5. **Testable**: Pure Dart models, injectable dependencies

### Documentation
- Comprehensive README with getting started guide
- Firebase setup documentation
- Inline code comments
- Architecture diagrams
- Data model specifications
- Roadmap for future phases

## [Unreleased]

### Phase 2: Target Visualization (Planned)
- Interactive archery target canvas
- Drag-and-drop arrow placement
- Automatic score calculation from position
- Shot grouping visualization
- Session statistics with target view

### Phase 3: Voice Notes (Planned)
- Audio recording during sessions
- Speech-to-text transcription
- Local and cloud note storage
- Playback controls
- Note search

### Phase 4: Cloud Sync & Leagues (Planned)
- Firebase Authentication
- Cloud Firestore sync
- Local-to-cloud data migration
- Weekly league system
- Duolingo-style leaderboards
- League tiers and promotions
- Cloud Functions for aggregation
- Social features and sharing

---

## Version History

- **1.0.0** - Phase 1 Complete - Local-first archery logging app
