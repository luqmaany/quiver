import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/user_profile.dart';
import 'models/archery_session.dart';
import 'models/shot_position.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive Adapters
  Hive.registerAdapter(UserProfileAdapter());
  Hive.registerAdapter(ArcherySessionAdapter());
  Hive.registerAdapter(ShotPositionAdapter());

  // Open Hive boxes
  await Hive.openBox<UserProfile>('userBox');
  await Hive.openBox<ArcherySession>('sessionsBox');

  runApp(
    const ProviderScope(
      child: QuiverApp(),
    ),
  );
}
