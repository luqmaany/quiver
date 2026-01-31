import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/user_provider.dart';
import '../../providers/auth_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userProfileNotifierProvider);
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: ListView(
        children: [
          // User Profile Section
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      userProfile.displayName?[0].toUpperCase() ?? 'A',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    userProfile.displayName ?? 'Archer',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  if (userProfile.email != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      userProfile.email!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  if (!authState.isAuthenticated) ...[
                    const SizedBox(height: 8),
                    Chip(
                      label: const Text('Local Only'),
                      avatar: const Icon(Icons.phone_android, size: 16),
                      backgroundColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Profile Settings
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              'Profile',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Display Name'),
            subtitle: Text(userProfile.displayName ?? 'Not set'),
            trailing: const Icon(Icons.edit),
            onTap: () => _editDisplayName(context, ref, userProfile.displayName),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: Text(userProfile.email ?? 'Not set'),
            trailing: const Icon(Icons.edit),
            onTap: () => _editEmail(context, ref, userProfile.email),
          ),

          const Divider(),

          // Sync Settings
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              'Cloud Sync',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          if (!authState.isAuthenticated)
            ListTile(
              leading: const Icon(Icons.cloud_upload),
              title: const Text('Sign in to Sync'),
              subtitle: const Text('Backup your data and sync across devices'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => _showSyncInfo(context),
            )
          else
            ListTile(
              leading: const Icon(Icons.cloud_done),
              title: const Text('Synced'),
              subtitle: Text('Signed in as ${authState.email}'),
              trailing: TextButton(
                onPressed: () => _signOut(context, ref),
                child: const Text('Sign Out'),
              ),
            ),

          const Divider(),

          // League Settings
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              'Leagues (Coming Soon)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.public),
            title: const Text('Public Profile'),
            subtitle: const Text('Allow others to see you on leaderboards'),
            value: userProfile.isPublic,
            onChanged: (value) {
              ref.read(userProfileNotifierProvider.notifier).togglePublicProfile();
            },
          ),

          const Divider(),

          // About
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('Version'),
            subtitle: Text('1.0.0 - Phase 1'),
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('Open Source'),
            subtitle: const Text('Built with Flutter & Riverpod'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void _editDisplayName(BuildContext context, WidgetRef ref, String? currentName) {
    final controller = TextEditingController(text: currentName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Display Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Display Name',
            hintText: 'Enter your name',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(userProfileNotifierProvider.notifier)
                  .updateDisplayName(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _editEmail(BuildContext context, WidgetRef ref, String? currentEmail) {
    final controller = TextEditingController(text: currentEmail);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Email'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Email',
            hintText: 'Enter your email',
          ),
          keyboardType: TextInputType.emailAddress,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(userProfileNotifierProvider.notifier)
                  .updateEmail(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showSyncInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cloud Sync'),
        content: const Text(
          'Cloud sync will be available in Phase 4!\n\n'
          'Features coming soon:\n'
          '• Backup your sessions\n'
          '• Sync across devices\n'
          '• Compete in leagues\n'
          '• Share achievements',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  void _signOut(BuildContext context, WidgetRef ref) {
    // Placeholder for Phase 4
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Sign out functionality coming in Phase 4'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
