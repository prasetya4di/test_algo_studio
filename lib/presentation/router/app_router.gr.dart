// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:test_algo_studio/presentation/screen/add_task/add_task_screen.dart'
    as _i1;
import 'package:test_algo_studio/presentation/screen/task/task_screen.dart'
    as _i2;

/// generated route for
/// [_i1.AddTaskScreen]
class AddTaskRoute extends _i3.PageRouteInfo<AddTaskRouteArgs> {
  AddTaskRoute({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          AddTaskRoute.name,
          args: AddTaskRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddTaskRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<AddTaskRouteArgs>(orElse: () => const AddTaskRouteArgs());
      return _i1.AddTaskScreen(key: args.key);
    },
  );
}

class AddTaskRouteArgs {
  const AddTaskRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'AddTaskRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.TaskScreen]
class TaskRoute extends _i3.PageRouteInfo<void> {
  const TaskRoute({List<_i3.PageRouteInfo>? children})
      : super(
          TaskRoute.name,
          initialChildren: children,
        );

  static const String name = 'TaskRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.TaskScreen();
    },
  );
}
