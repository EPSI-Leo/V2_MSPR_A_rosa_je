// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advices.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Advices _$AdvicesFromJson(Map<String, dynamic> json) {
  return _Advices.fromJson(json);
}

/// @nodoc
mixin _$Advices {
  int get totalItems => throw _privateConstructorUsedError;
  List<Advice>? get advices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdvicesCopyWith<Advices> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvicesCopyWith<$Res> {
  factory $AdvicesCopyWith(Advices value, $Res Function(Advices) then) =
      _$AdvicesCopyWithImpl<$Res, Advices>;
  @useResult
  $Res call({int totalItems, List<Advice>? advices});
}

/// @nodoc
class _$AdvicesCopyWithImpl<$Res, $Val extends Advices>
    implements $AdvicesCopyWith<$Res> {
  _$AdvicesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? advices = freezed,
  }) {
    return _then(_value.copyWith(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      advices: freezed == advices
          ? _value.advices
          : advices // ignore: cast_nullable_to_non_nullable
              as List<Advice>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdvicesImplCopyWith<$Res> implements $AdvicesCopyWith<$Res> {
  factory _$$AdvicesImplCopyWith(
          _$AdvicesImpl value, $Res Function(_$AdvicesImpl) then) =
      __$$AdvicesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalItems, List<Advice>? advices});
}

/// @nodoc
class __$$AdvicesImplCopyWithImpl<$Res>
    extends _$AdvicesCopyWithImpl<$Res, _$AdvicesImpl>
    implements _$$AdvicesImplCopyWith<$Res> {
  __$$AdvicesImplCopyWithImpl(
      _$AdvicesImpl _value, $Res Function(_$AdvicesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? advices = freezed,
  }) {
    return _then(_$AdvicesImpl(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      advices: freezed == advices
          ? _value._advices
          : advices // ignore: cast_nullable_to_non_nullable
              as List<Advice>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdvicesImpl implements _Advices {
  const _$AdvicesImpl(
      {required this.totalItems, required final List<Advice>? advices})
      : _advices = advices;

  factory _$AdvicesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdvicesImplFromJson(json);

  @override
  final int totalItems;
  final List<Advice>? _advices;
  @override
  List<Advice>? get advices {
    final value = _advices;
    if (value == null) return null;
    if (_advices is EqualUnmodifiableListView) return _advices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Advices(totalItems: $totalItems, advices: $advices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdvicesImpl &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            const DeepCollectionEquality().equals(other._advices, _advices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalItems, const DeepCollectionEquality().hash(_advices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdvicesImplCopyWith<_$AdvicesImpl> get copyWith =>
      __$$AdvicesImplCopyWithImpl<_$AdvicesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdvicesImplToJson(
      this,
    );
  }
}

abstract class _Advices implements Advices {
  const factory _Advices(
      {required final int totalItems,
      required final List<Advice>? advices}) = _$AdvicesImpl;

  factory _Advices.fromJson(Map<String, dynamic> json) = _$AdvicesImpl.fromJson;

  @override
  int get totalItems;
  @override
  List<Advice>? get advices;
  @override
  @JsonKey(ignore: true)
  _$$AdvicesImplCopyWith<_$AdvicesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
