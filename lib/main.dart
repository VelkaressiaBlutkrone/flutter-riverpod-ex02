import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_ui_app_ex01/logger.dart';
import 'package:flutter_card_ui_app_ex01/screens/card_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (defaultTargetPlatform == TargetPlatform.android) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
    );
  }
  // Important for Offline Collaboration
  // await AppflowyEditorSyncUtilityFunctions.initAppFlowyEditorSync();

  logger.i('Start');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    logger.d('App Build');
    return MaterialApp(
      title: 'Card-UI-Todo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [AppFlowyEditorLocalizations.delegate],
      supportedLocales: AppFlowyEditorLocalizations.delegate.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        cardTheme: const CardThemeData(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(11)),
          ),
        ),
      ),
      home: const CardListScreen(),
    );
  }
}
