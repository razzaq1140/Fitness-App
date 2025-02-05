import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_total_fit/src/feature/ai_chat/provider/ai_chat_provider.dart';
import 'package:my_total_fit/src/feature/bottom_navigation_bar/bottom_navigation_provider.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:my_total_fit/src/theme/app_theme.dart';
import 'package:provider/provider.dart';

GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider<OnboardingProvider>(
          create: (_) => OnboardingProvider(),
        ),
        ChangeNotifierProvider<BottomNavigationProvider>(
          create: (context) => BottomNavigationProvider(),
        ),
        ChangeNotifierProvider<AiChatProvider>(
          create: (context) => AiChatProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.instance.lightTheme,
      routerDelegate: MyAppRouter.router.routerDelegate,
      routeInformationParser: MyAppRouter.router.routeInformationParser,
      routeInformationProvider: MyAppRouter.router.routeInformationProvider,
    );
  }
}
