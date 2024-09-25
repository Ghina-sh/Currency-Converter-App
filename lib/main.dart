import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/app/dependency_injection.dart' as di;
import 'core/app/my_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.inject();
  runApp(
    kReleaseMode ? const MyApp() : const DevicePreviewApp(),
  );
}

class DevicePreviewApp extends StatelessWidget {
  const DevicePreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    );
  }
}
