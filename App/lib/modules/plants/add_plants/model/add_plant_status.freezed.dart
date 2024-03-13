// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_plant_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPlantStatus {
  String get name => throw _privateConstructorUsedError;
  String get beginAt => throw _privateConstructorUsedError;
  String get endAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isButtonActive => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPlantStatusCopyWith<AddPlantStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPlantStatusCopyWith<$Res> {
  factory $AddPlantStatusCopyWith(
          AddPlantStatus value, $Res Function(AddPlantStatus) then) =
      _$AddPlantStatusCopyWithImpl<$Res, AddPlantStatus>;
  @useResult
  $Res call(
      {String name,
      String beginAt,
      String endAt,
      String description,
      bool isButtonActive,
      bool isLoading});
}

/// @nodoc
class _$AddPlantStatusCopyWithImpl<$Res, $Val extends AddPlantStatus>
    implements $AddPlantStatusCopyWith<$Res> {
  _$AddPlantStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? beginAt = null,
    Object? endAt = null,
    Object? description = null,
    Object? isButtonActive = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      beginAt: null == beginAt
          ? _value.beginAt
          : beginAt // ignore: cast_nullable_to_non_nullable
              as String,
      endAt: null == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isButtonActive: null == isButtonActive
          ? _value.isButtonActive
          : isButtonActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddPlantStatusImplCopyWith<$Res>
    implements $AddPlantStatusCopyWith<$Res> {
  factory _$$AddPlantStatusImplCopyWith(_$AddPlantStatusImpl value,
          $Res Function(_$AddPlantStatusImpl) then) =
      __$$AddPlantStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String beginAt,
      String endAt,
      String description,
      bool isButtonActive,
      bool isLoading});
}

/// @nodoc
class __$$AddPlantStatusImplCopyWithImpl<$Res>
    extends _$AddPlantStatusCopyWithImpl<$Res, _$AddPlantStatusImpl>
    implements _$$AddPlantStatusImplCopyWith<$Res> {
  __$$AddPlantStatusImplCopyWithImpl(
      _$AddPlantStatusImpl _value, $Res Function(_$AddPlantStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? beginAt = null,
    Object? endAt = null,
    Object? description = null,
    Object? isButtonActive = null,
    Object? isLoading = null,
  }) {
    return _then(_$AddPlantStatusImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      beginAt: null == beginAt
          ? _value.beginAt
          : beginAt // ignore: cast_nullable_to_non_nullable
              as String,
      endAt: null == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isButtonActive: null == isButtonActive
          ? _value.isButtonActive
          : isButtonActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddPlantStatusImpl implements _AddPlantStatus {
  _$AddPlantStatusImpl(
      {this.name = '',
      this.beginAt = '',
      this.endAt = '',
      this.description = '',
      this.isButtonActive = false,
      this.isLoading = false});

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String beginAt;
  @override
  @JsonKey()
  final String endAt;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool isButtonActive;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AddPlantStatus(name: $name, beginAt: $beginAt, endAt: $endAt, description: $description, isButtonActive: $isButtonActive, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPlantStatusImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.beginAt, beginAt) || other.beginAt == beginAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isButtonActive, isButtonActive) ||
                other.isButtonActive == isButtonActive) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, beginAt, endAt,
      description, isButtonActive, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPlantStatusImplCopyWith<_$AddPlantStatusImpl> get copyWith =>
      __$$AddPlantStatusImplCopyWithImpl<_$AddPlantStatusImpl>(
          this, _$identity);
}

abstract class _AddPlantStatus implements AddPlantStatus {
  factory _AddPlantStatus(
      {final String name,
      final String beginAt,
      final String endAt,
      final String description,
      final bool isButtonActive,
      final bool isLoading}) = _$AddPlantStatusImpl;

  @override
  String get name;
  @override
  String get beginAt;
  @override
  String get endAt;
  @override
  String get description;
  @override
  bool get isButtonActive;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$AddPlantStatusImplCopyWith<_$AddPlantStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
