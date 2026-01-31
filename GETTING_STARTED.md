# Getting Started with Quiver

Welcome to Quiver! This guide will help you start logging your archery sessions in minutes.

## Quick Start (3 Steps)

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Run the App

```bash
flutter run
```

That's it! No Firebase setup needed. No sign-up required. Just start logging.

## First Launch

When you first open Quiver:

1. **Automatic Profile Creation** - A local profile is created for you automatically
2. **Empty State** - You'll see a welcome screen with an archery target icon
3. **Ready to Log** - Tap "New Session" to start

## Logging Your First Session

### Step 1: Create a Session
1. Tap the **"New Session"** floating button (bottom right)
2. A session is created with the current date and time

### Step 2: Add Details
1. Enter a **title** (e.g., "Morning Practice", "Competition Prep")
2. Enter **number of arrows** shot
3. Enter your **total score**
4. The app automatically calculates your **average score per arrow**

### Step 3: Save
1. Tap the **checkmark** icon (top right)
2. You're back on the home screen with your session saved!

## Viewing Your Sessions

- Sessions appear on the home screen in **reverse chronological order** (newest first)
- Each card shows:
  - Session title
  - Date and time
  - Number of arrows
  - Total score
  - Average score

## Editing a Session

1. Tap any session card
2. Edit the details
3. Tap the checkmark to save

## Deleting a Session

**Option 1: Via Card Menu**
1. Tap the three-dot menu on a session card
2. Select "Delete"
3. Confirm deletion

**Option 2: Via Detail Screen**
1. Open the session
2. Tap the three-dot menu
3. Select "Delete"

## Customizing Your Profile

1. Tap the **Settings** icon (top right on home screen)
2. Edit your **display name** (tap the row)
3. Add your **email** (optional)
4. Toggle **Public Profile** if you want to participate in future leagues

## Understanding the Interface

### Home Screen
- **App Bar**: Shows "Quiver" title and settings icon
- **Session Cards**: Your practice sessions
- **FAB (Floating Action Button)**: "New Session" button

### Session Detail Screen
- **Date Card**: Shows when you practiced (blue/green background)
- **Title Field**: Name your session
- **Arrow Count**: How many arrows you shot
- **Total Score**: Your cumulative score
- **Statistics Card**: Auto-calculated stats
- **Target Placeholder**: Coming in Phase 2!

### Settings Screen
- **Profile Card**: Your avatar, name, email
- **Profile Section**: Edit display name and email
- **Cloud Sync**: Shows local-only status (Phase 4 will enable sync)
- **Public Profile Toggle**: Prepare for future leagues
- **About Section**: App version and info

## Tips for Best Results

### 1. Consistent Logging
Log every session, even short ones. This builds your practice history.

### 2. Descriptive Titles
Use titles that help you remember the session:
- "Morning warmup - 70m"
- "Competition sim - indoor"
- "Form practice - slow shooting"

### 3. Accurate Counting
Count all arrows, even misses. This makes your statistics meaningful.

### 4. Regular Review
Check your home screen regularly to see your progress over time.

## What's Stored Locally

All your data is stored on your device using Hive:
- User profile (display name, preferences)
- All practice sessions
- Session statistics

**No internet required!** Everything works offline.

## Future Features (Coming Soon)

### Phase 2: Target Visualization
- Drag and drop arrows onto a target
- Visual shot placement
- Grouping analysis

### Phase 3: Voice Notes
- Record voice notes during practice
- Automatic transcription
- Searchable session notes

### Phase 4: Cloud Sync & Leagues
- Sign in to backup your data
- Sync across devices
- Compete in weekly leagues
- Duolingo-style leaderboards

## Common Questions

### Do I need to sign up?
**No!** The app works immediately without any account.

### Where is my data stored?
**On your device** using Hive (a fast, local database).

### Can I use it offline?
**Yes!** Everything works without internet.

### How do I backup my data?
**Phase 4** will add cloud backup. For now, your data is local only.

### Can I use it on multiple devices?
**Not yet.** Phase 4 will add cloud sync for multi-device support.

### Is it free?
**Yes!** The app is free to use. Cloud features (Phase 4) will use Firebase free tier.

## Troubleshooting

### App won't start
1. Make sure you ran `flutter pub get`
2. Try `flutter clean` then `flutter pub get` again
3. Restart your IDE

### Can't create sessions
1. Check that Hive initialized properly (should happen automatically)
2. Check storage permissions on your device
3. Try restarting the app

### Data disappeared
Data is stored in Hive boxes. Uninstalling the app will delete local data. Keep the app installed to preserve your sessions.

## Getting Help

- Check the [README.md](README.md) for technical details
- Review [FIREBASE_SETUP.md](FIREBASE_SETUP.md) for future cloud setup
- See [CHANGELOG.md](CHANGELOG.md) for what's implemented

## Ready to Improve Your Archery?

That's it! You're ready to start tracking your practice sessions. Every arrow counts!

🎯 **Happy shooting!** 🎯

---

**Remember**: The more consistently you log your sessions, the better you can track your improvement over time. Make Quiver part of your practice routine!
