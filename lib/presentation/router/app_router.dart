import 'package:auto_route/auto_route.dart';
import 'package:test_algo_studio/presentation/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AddTaskRoute.page),
      ];
}
