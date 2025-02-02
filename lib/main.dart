import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_algo_studio/domain/entity/task.dart';
import 'package:test_algo_studio/presentation/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  runApp(ProviderScope(child: MyApp()));
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
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
        scaffoldBackgroundColor: Colors.grey[100],
        cardTheme: const CardTheme(
          color: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        bottomSheetTheme:  BottomSheetThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          showDragHandle: true,
          dragHandleColor: Colors.grey[200],
          dragHandleSize: const Size(80, 4),
        ),
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          centerTitle: false,
          titleTextStyle: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
