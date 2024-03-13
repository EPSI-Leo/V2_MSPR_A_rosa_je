// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Advice _$AdviceFromJson(Map<String, dynamic> json) {
  return _Advice.fromJson(json);
}

/// @nodoc
mixin _$Advice {
  String? get id => throw _privateConstructorUsedError;
  String? get idUser => throw _privateConstructorUsedError;
  String? get idPlant => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get advice1 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdviceCopyWith<Advice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdviceCopyWith<$Res> {
  factory $AdviceCopyWith(Advice value, $Res Function(Advice) then) =
      _$AdviceCopyWithImpl<$Res, Advice>;
  @useResult
  $Res call(
      {String? id,
      String? idUser,
      String? idPlant,
      String? name,
      String? advice1});
}

/// @nodoc
class _$AdviceCopyWithImpl<$Res, $Val extends Advice>
    implements $AdviceCopyWith<$Res> {
  _$AdviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idUser = freezed,
    Object? idPlant = freezed,
    Object? name = freezed,
    Object? advice1 = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idUser: freezed == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String?,
      idPlant: freezed == idPlant
          ? _value.idPlant
          : idPlant // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      advice1: freezed == advice1
          ? _value.advice1
          : advice1 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdviceImplCopyWith<$Res> implements $AdviceCopyWith<$Res> {
  factory _$$AdviceImplCopyWith(
          _$AdviceImpl value, $Res Function(_$AdviceImpl) then) =
      __$$AdviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? idUser,
      String? idPlant,
      String? name,
      String? advice1});
}

/// @nodoc
class __$$AdviceImplCopyWithImpl<$Res>
    extends _$AdviceCopyWithImpl<$Res, _$AdviceImpl>
    implements _$$AdviceImplCopyWith<$Res> {
  __$$AdviceImplCopyWithImpl(
      _$AdviceImpl _value, $Res Function(_$AdviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idUser = freezed,
    Object? idPlant = freezed,
    Object? name = freezed,
    Object? advice1 = freezed,
  }) {
    return _then(_$AdviceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idUser: freezed == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String?,
      idPlant: freezed == idPlant
          ? _value.idPlant
          : idPlant // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      advice1: freezed == advice1
          ? _value.advice1
          : advice1 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdviceImpl implements _Advice {
  const _$AdviceImpl(
      {required this.id,
      required this.idUser,
      required this.idPlant,
      required this.name,
      required this.advice1});

  factory _$AdviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdviceImplFromJson(json);

  @override
  final String? id;
  @override
  final String? idUser;
  @override
  final String? idPlant;
  @override
  final String? name;
  @override
  final String? advice1;

  @override
  String toString() {
    return 'Advice(id: $id, idUser: $idUser, idPlant: $idPlant, name: $name, advice1: $advice1)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.idPlant, idPlant) || other.idPlant == idPlant) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.advice1, advice1) || other.advice1 == advice1));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, idUser, idPlant, name, advice1);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdviceImplCopyWith<_$AdviceImpl> get copyWith =>
      __$$AdviceImplCopyWithImpl<_$AdviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdviceImplToJson(
      this,
    );
  }
}

abstract class _Advice implements Advice {
  const factory _Advice(
      {required final String? id,
      required final String? idUser,
      required final String? idPlant,
      required final String? name,
      required final String? advice1}) = _$AdviceImpl;

  factory _Advice.fromJson(Map<String, dynamic> json) = _$AdviceImpl.fromJson;

  @override
  String? get id;
  @override
  String? get idUser;
  @override
  String? get idPlant;
  @override
  String? get name;
  @override
  String? get advice1;
  @override
  @JsonKey(ignore: true)
  _$$AdviceImplCopyWith<_$AdviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
