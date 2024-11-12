// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskState {
  AsyncValue<List<TaskGroup>> get allTask => throw _privateConstructorUsedError;
  AsyncValue<bool> get addTask => throw _privateConstructorUsedError;
  AsyncValue<bool> get deleteTask => throw _privateConstructorUsedError;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskStateCopyWith<TaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStateCopyWith<$Res> {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) then) =
      _$TaskStateCopyWithImpl<$Res, TaskState>;
  @useResult
  $Res call(
      {AsyncValue<List<TaskGroup>> allTask,
      AsyncValue<bool> addTask,
      AsyncValue<bool> deleteTask});
}

/// @nodoc
class _$TaskStateCopyWithImpl<$Res, $Val extends TaskState>
    implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTask = null,
    Object? addTask = null,
    Object? deleteTask = null,
  }) {
    return _then(_value.copyWith(
      allTask: null == allTask
          ? _value.allTask
          : allTask // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TaskGroup>>,
      addTask: null == addTask
          ? _value.addTask
          : addTask // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
      deleteTask: null == deleteTask
          ? _value.deleteTask
          : deleteTask // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskStateImplCopyWith<$Res>
    implements $TaskStateCopyWith<$Res> {
  factory _$$TaskStateImplCopyWith(
          _$TaskStateImpl value, $Res Function(_$TaskStateImpl) then) =
      __$$TaskStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<TaskGroup>> allTask,
      AsyncValue<bool> addTask,
      AsyncValue<bool> deleteTask});
}

/// @nodoc
class __$$TaskStateImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskStateImpl>
    implements _$$TaskStateImplCopyWith<$Res> {
  __$$TaskStateImplCopyWithImpl(
      _$TaskStateImpl _value, $Res Function(_$TaskStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTask = null,
    Object? addTask = null,
    Object? deleteTask = null,
  }) {
    return _then(_$TaskStateImpl(
      allTask: null == allTask
          ? _value.allTask
          : allTask // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TaskGroup>>,
      addTask: null == addTask
          ? _value.addTask
          : addTask // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
      deleteTask: null == deleteTask
          ? _value.deleteTask
          : deleteTask // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
    ));
  }
}

/// @nodoc

class _$TaskStateImpl implements _TaskState {
  const _$TaskStateImpl(
      {required this.allTask, required this.addTask, required this.deleteTask});

  @override
  final AsyncValue<List<TaskGroup>> allTask;
  @override
  final AsyncValue<bool> addTask;
  @override
  final AsyncValue<bool> deleteTask;

  @override
  String toString() {
    return 'TaskState(allTask: $allTask, addTask: $addTask, deleteTask: $deleteTask)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskStateImpl &&
            (identical(other.allTask, allTask) || other.allTask == allTask) &&
            (identical(other.addTask, addTask) || other.addTask == addTask) &&
            (identical(other.deleteTask, deleteTask) ||
                other.deleteTask == deleteTask));
  }

  @override
  int get hashCode => Object.hash(runtimeType, allTask, addTask, deleteTask);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskStateImplCopyWith<_$TaskStateImpl> get copyWith =>
      __$$TaskStateImplCopyWithImpl<_$TaskStateImpl>(this, _$identity);
}

abstract class _TaskState implements TaskState {
  const factory _TaskState(
      {required final AsyncValue<List<TaskGroup>> allTask,
      required final AsyncValue<bool> addTask,
      required final AsyncValue<bool> deleteTask}) = _$TaskStateImpl;

  @override
  AsyncValue<List<TaskGroup>> get allTask;
  @override
  AsyncValue<bool> get addTask;
  @override
  AsyncValue<bool> get deleteTask;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskStateImplCopyWith<_$TaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
