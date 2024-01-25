import 'package:flutter/material.dart';
import 'package:starter_project/app/app.bottomsheets.dart';
import 'package:starter_project/app/app.dialogs.dart';
import 'package:starter_project/app/app.locator.dart';
import 'package:starter_project/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:seo_renderer/seo_renderer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RobotDetector(
      debug: true, // you can set true to enable robot mode

      child: MaterialApp(
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [seoRouteObserver],
      ),
    );
  }
}
