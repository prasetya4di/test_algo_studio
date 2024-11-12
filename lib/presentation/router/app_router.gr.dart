// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:test_algo_studio/presentation/screen/add_task/add_task_screen.dart'
    as _i1;
import 'package:test_algo_studio/presentation/screen/home/home_screen.dart'
    as _i2;

/// generated route for
/// [_i1.AddTaskScreen]
class AddTaskRoute extends _i3.PageRouteInfo<void> {
  const AddTaskRoute({List<_i3.PageRouteInfo>? children})
      : super(
          AddTaskRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTaskRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddTaskScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}
