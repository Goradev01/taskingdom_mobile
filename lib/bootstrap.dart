import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  // Add any pre-initialization logic here (e.g., Firebase, Sentry, etc.)

  runApp(
    ProviderScope(
      child: await builder(),
    ),
  );
}