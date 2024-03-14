// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plants.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Plants _$PlantsFromJson(Map<String, dynamic> json) {
  return _Plants.fromJson(json);
}

/// @nodoc
mixin _$Plants {
  int get totalItems => throw _privateConstructorUsedError;
  List<Plant>? get plants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlantsCopyWith<Plants> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantsCopyWith<$Res> {
  factory $PlantsCopyWith(Plants value, $Res Function(Plants) then) =
      _$PlantsCopyWithImpl<$Res, Plants>;
  @useResult
  $Res call({int totalItems, List<Plant>? plants});
}

/// @nodoc
class _$PlantsCopyWithImpl<$Res, $Val extends Plants>
    implements $PlantsCopyWith<$Res> {
  _$PlantsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? plants = freezed,
  }) {
    return _then(_value.copyWith(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      plants: freezed == plants
          ? _value.plants
          : plants // ignore: cast_nullable_to_non_nullable
              as List<Plant>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlantsImplCopyWith<$Res> implements $PlantsCopyWith<$Res> {
  factory _$$PlantsImplCopyWith(
          _$PlantsImpl value, $Res Function(_$PlantsImpl) then) =
      __$$PlantsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalItems, List<Plant>? plants});
}

/// @nodoc
class __$$PlantsImplCopyWithImpl<$Res>
    extends _$PlantsCopyWithImpl<$Res, _$PlantsImpl>
    implements _$$PlantsImplCopyWith<$Res> {
  __$$PlantsImplCopyWithImpl(
      _$PlantsImpl _value, $Res Function(_$PlantsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? plants = freezed,
  }) {
    return _then(_$PlantsImpl(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      plants: freezed == plants
          ? _value._plants
          : plants // ignore: cast_nullable_to_non_nullable
              as List<Plant>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlantsImpl implements _Plants {
  const _$PlantsImpl(
      {required this.totalItems, required final List<Plant>? plants})
      : _plants = plants;

  factory _$PlantsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantsImplFromJson(json);

  @override
  final int totalItems;
  final List<Plant>? _plants;
  @override
  List<Plant>? get plants {
    final value = _plants;
    if (value == null) return null;
    if (_plants is EqualUnmodifiableListView) return _plants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Plants(totalItems: $totalItems, plants: $plants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantsImpl &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            const DeepCollectionEquality().equals(other._plants, _plants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalItems, const DeepCollectionEquality().hash(_plants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantsImplCopyWith<_$PlantsImpl> get copyWith =>
      __$$PlantsImplCopyWithImpl<_$PlantsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantsImplToJson(
      this,
    );
  }
}

abstract class _Plants implements Plants {
  const factory _Plants(
      {required final int totalItems,
      required final List<Plant>? plants}) = _$PlantsImpl;

  factory _Plants.fromJson(Map<String, dynamic> json) = _$PlantsImpl.fromJson;

  @override
  int get totalItems;
  @override
  List<Plant>? get plants;
  @override
  @JsonKey(ignore: true)
  _$$PlantsImplCopyWith<_$PlantsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
