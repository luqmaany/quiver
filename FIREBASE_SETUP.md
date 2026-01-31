# Firebase Setup Guide

This guide will help you set up Firebase for cloud sync and future league features in Phase 4.

## Prerequisites

- A Google account
- The Quiver app running locally

## Step 1: Install FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

Make sure the pub global bin directory is in your PATH.

## Step 2: Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click "Add project"
3. Name your project "Quiver" (or your preferred name)
4. Disable Google Analytics (optional for this project)
5. Click "Create project"

## Step 3: Configure Flutter App with Firebase

Run the FlutterFire configuration command:

```bash
flutterfire configure
```

This will:
- Prompt you to select your Firebase project
- Generate the `firebase_options.dart` file with your configuration
- Configure Firebase for all platforms (Android, iOS, Web)

## Step 4: Enable Authentication

1. In Firebase Console, go to "Authentication"
2. Click "Get started"
3. Enable "Email/Password" sign-in method
4. Optionally enable "Google" sign-in for social login

## Step 5: Create Firestore Database

1. In Firebase Console, go to "Firestore Database"
2. Click "Create database"
3. Start in **Production mode** (we'll set custom rules next)
4. Choose a location closest to your users

## Step 6: Set Up Firestore Security Rules

Replace the default rules with these:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // User's own data
    match /users/{userId}/{document=**} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Future: leaderboards readable by authenticated users
    match /leaderboards/{weekId}/rankings/{rankId} {
      allow read: if request.auth != null;
    }
    
    // Future: league data
    match /leagues/{tier}/members/{memberId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null && request.auth.uid == memberId;
    }
  }
}
```

## Step 7: Test Firebase Connection

After configuration, test the connection:

```bash
flutter run
```

The app should start without Firebase errors. Cloud sync features will be implemented in Phase 4.

## Firestore Data Structure

When implemented, the database will follow this structure:

```
/users/{uid}
  ├── profile (UserProfile document)
  │   ├── id: string
  │   ├── displayName: string
  │   ├── email: string
  │   ├── isPublic: boolean
  │   ├── createdAt: timestamp
  │   └── isSynced: boolean
  │
  └── sessions/ (subcollection)
      └── {sessionId} (ArcherySession document)
          ├── id: string
          ├── ownerId: string
          ├── date: timestamp
          ├── title: string
          ├── arrowCount: number
          ├── totalScore: number
          ├── averageScore: number
          ├── shots: array
          ├── voiceNoteUrl: string
          ├── transcription: string
          ├── isSynced: boolean
          ├── createdAt: timestamp
          └── updatedAt: timestamp

# Future additions for leagues (Phase 4):
/leaderboards/{weekId}/
  └── rankings/ (subcollection)
      └── {userId} (user ranking document)
          ├── userId: string
          ├── displayName: string
          ├── weeklyPoints: number
          ├── totalArrows: number
          ├── averageScore: number
          └── rank: number

/leagues/{tier}/
  └── members/ (subcollection)
      └── {userId}
          ├── userId: string
          ├── currentTier: string
          ├── points: number
          └── joinedAt: timestamp
```

## Cost Considerations

Firebase has a generous free tier:

- **Authentication**: Free for all use
- **Firestore**: 
  - 50,000 reads/day
  - 20,000 writes/day
  - 20,000 deletes/day
  - 1 GiB storage
- **Storage** (for voice notes in Phase 3): 5 GB free

For a personal archery logging app, you'll likely stay within the free tier.

## Troubleshooting

### "Firebase not initialized"
- Ensure `flutterfire configure` completed successfully
- Check that `firebase_options.dart` was generated
- Verify Firebase is initialized in `main.dart`

### "Permission denied" errors
- Check Firestore security rules are set correctly
- Ensure user is authenticated before accessing Firestore
- Verify the authenticated user's UID matches the document path

### Platform-specific issues
- **Android**: Check `android/app/google-services.json` exists
- **iOS**: Check `ios/Runner/GoogleService-Info.plist` exists
- **Web**: Check `web/index.html` has Firebase configuration

## Next Steps

Once Firebase is configured:
1. The app will continue to work in local-only mode
2. Phase 4 will implement cloud sync functionality
3. Sign-in flow will be activated in Settings screen
4. Local data can be migrated to the cloud on first sign-in

---

**Note**: Firebase setup is optional for Phase 1-3. The app is fully functional with local storage only.
