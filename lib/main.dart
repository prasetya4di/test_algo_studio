import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_algo_studio/presentation/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Test Algo Studio',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
