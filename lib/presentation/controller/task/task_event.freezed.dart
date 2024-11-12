// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
    required TResult Function(Task task) add,
    required TResult Function(Task task) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? get,
    TResult? Function(Task task)? add,
    TResult? Function(Task task)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(Task task)? add,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Get value) get,
    required TResult Function(Add value) add,
    required TResult Function(Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Get value)? get,
    TResult? Function(Add value)? add,
    TResult? Function(Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Get value)? get,
    TResult Function(Add value)? add,
    TResult Function(Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEventCopyWith<$Res> {
  factory $TaskEventCopyWith(TaskEvent value, $Res Function(TaskEvent) then) =
      _$TaskEventCopyWithImpl<$Res, TaskEvent>;
}

/// @nodoc
class _$TaskEventCopyWithImpl<$Res, $Val extends TaskEvent>
    implements $TaskEventCopyWith<$Res> {
  _$TaskEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetImplCopyWith<$Res> {
  factory _$$GetImplCopyWith(_$GetImpl value, $Res Function(_$GetImpl) then) =
      __$$GetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$GetImpl>
    implements _$$GetImplCopyWith<$Res> {
  __$$GetImplCopyWithImpl(_$GetImpl _value, $Res Function(_$GetImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetImpl implements Get {
  const _$GetImpl();

  @override
  String toString() {
    return 'TaskEvent.get()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
    required TResult Function(Task task) add,
    required TResult Function(Task task) delete,
  }) {
    return get();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? get,
    TResult? Function(Task task)? add,
    TResult? Function(Task task)? delete,
  }) {
    return get?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(Task task)? add,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Get value) get,
    required TResult Function(Add value) add,
    required TResult Function(Delete value) delete,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Get value)? get,
    TResult? Function(Add value)? add,
    TResult? Function(Delete value)? delete,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Get value)? get,
    TResult Function(Add value)? add,
    TResult Function(Delete value)? delete,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class Get implements TaskEvent {
  const factory Get() = _$GetImpl;
}

/// @nodoc
abstract class _$$AddImplCopyWith<$Res> {
  factory _$$AddImplCopyWith(_$AddImpl value, $Res Function(_$AddImpl) then) =
      __$$AddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Task task});
}

/// @nodoc
class __$$AddImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$AddImpl>
    implements _$$AddImplCopyWith<$Res> {
  __$$AddImplCopyWithImpl(_$AddImpl _value, $Res Function(_$AddImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$AddImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }
}

/// @nodoc

class _$AddImpl implements Add {
  const _$AddImpl(this.task);

  @override
  final Task task;

  @override
  String toString() {
    return 'TaskEvent.add(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      __$$AddImplCopyWithImpl<_$AddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
    required TResult Function(Task task) add,
    required TResult Function(Task task) delete,
  }) {
    return add(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? get,
    TResult? Function(Task task)? add,
    TResult? Function(Task task)? delete,
  }) {
    return add?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(Task task)? add,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Get value) get,
    required TResult Function(Add value) add,
    required TResult Function(Delete value) delete,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Get value)? get,
    TResult? Function(Add value)? add,
    TResult? Function(Delete value)? delete,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Get value)? get,
    TResult Function(Add value)? add,
    TResult Function(Delete value)? delete,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class Add implements TaskEvent {
  const factory Add(final Task task) = _$AddImpl;

  Task get task;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Task task});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$DeleteImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements Delete {
  const _$DeleteImpl(this.task);

  @override
  final Task task;

  @override
  String toString() {
    return 'TaskEvent.delete(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() get,
    required TResult Function(Task task) add,
    required TResult Function(Task task) delete,
  }) {
    return delete(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? get,
    TResult? Function(Task task)? add,
    TResult? Function(Task task)? delete,
  }) {
    return delete?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? get,
    TResult Function(Task task)? add,
    TResult Function(Task task)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Get value) get,
    required TResult Function(Add value) add,
    required TResult Function(Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Get value)? get,
    TResult? Function(Add value)? add,
    TResult? Function(Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Get value)? get,
    TResult Function(Add value)? add,
    TResult Function(Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class Delete implements TaskEvent {
  const factory Delete(final Task task) = _$DeleteImpl;

  Task get task;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
