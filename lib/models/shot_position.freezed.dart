// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shot_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShotPosition _$ShotPositionFromJson(Map<String, dynamic> json) {
  return _ShotPosition.fromJson(json);
}

/// @nodoc
mixin _$ShotPosition {
  @HiveField(0)
  double get x => throw _privateConstructorUsedError; // Normalized 0-1
  @HiveField(1)
  double get y => throw _privateConstructorUsedError; // Normalized 0-1
  @HiveField(2)
  int get score =>
      throw _privateConstructorUsedError; // Ring value (10, 9, 8...)
  @HiveField(3)
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this ShotPosition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShotPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShotPositionCopyWith<ShotPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShotPositionCopyWith<$Res> {
  factory $ShotPositionCopyWith(
          ShotPosition value, $Res Function(ShotPosition) then) =
      _$ShotPositionCopyWithImpl<$Res, ShotPosition>;
  @useResult
  $Res call(
      {@HiveField(0) double x,
      @HiveField(1) double y,
      @HiveField(2) int score,
      @HiveField(3) DateTime timestamp});
}

/// @nodoc
class _$ShotPositionCopyWithImpl<$Res, $Val extends ShotPosition>
    implements $ShotPositionCopyWith<$Res> {
  _$ShotPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShotPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? score = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShotPositionImplCopyWith<$Res>
    implements $ShotPositionCopyWith<$Res> {
  factory _$$ShotPositionImplCopyWith(
          _$ShotPositionImpl value, $Res Function(_$ShotPositionImpl) then) =
      __$$ShotPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) double x,
      @HiveField(1) double y,
      @HiveField(2) int score,
      @HiveField(3) DateTime timestamp});
}

/// @nodoc
class __$$ShotPositionImplCopyWithImpl<$Res>
    extends _$ShotPositionCopyWithImpl<$Res, _$ShotPositionImpl>
    implements _$$ShotPositionImplCopyWith<$Res> {
  __$$ShotPositionImplCopyWithImpl(
      _$ShotPositionImpl _value, $Res Function(_$ShotPositionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShotPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? score = null,
    Object? timestamp = null,
  }) {
    return _then(_$ShotPositionImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShotPositionImpl implements _ShotPosition {
  const _$ShotPositionImpl(
      {@HiveField(0) required this.x,
      @HiveField(1) required this.y,
      @HiveField(2) required this.score,
      @HiveField(3) required this.timestamp});

  factory _$ShotPositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShotPositionImplFromJson(json);

  @override
  @HiveField(0)
  final double x;
// Normalized 0-1
  @override
  @HiveField(1)
  final double y;
// Normalized 0-1
  @override
  @HiveField(2)
  final int score;
// Ring value (10, 9, 8...)
  @override
  @HiveField(3)
  final DateTime timestamp;

  @override
  String toString() {
    return 'ShotPosition(x: $x, y: $y, score: $score, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShotPositionImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, score, timestamp);

  /// Create a copy of ShotPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShotPositionImplCopyWith<_$ShotPositionImpl> get copyWith =>
      __$$ShotPositionImplCopyWithImpl<_$ShotPositionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShotPositionImplToJson(
      this,
    );
  }
}

abstract class _ShotPosition implements ShotPosition {
  const factory _ShotPosition(
      {@HiveField(0) required final double x,
      @HiveField(1) required final double y,
      @HiveField(2) required final int score,
      @HiveField(3) required final DateTime timestamp}) = _$ShotPositionImpl;

  factory _ShotPosition.fromJson(Map<String, dynamic> json) =
      _$ShotPositionImpl.fromJson;

  @override
  @HiveField(0)
  double get x; // Normalized 0-1
  @override
  @HiveField(1)
  double get y; // Normalized 0-1
  @override
  @HiveField(2)
  int get score; // Ring value (10, 9, 8...)
  @override
  @HiveField(3)
  DateTime get timestamp;

  /// Create a copy of ShotPosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShotPositionImplCopyWith<_$ShotPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
