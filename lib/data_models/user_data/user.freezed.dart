// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserClassData _$UserClassDataFromJson(Map<String, dynamic> json) {
  return _UserClassData.fromJson(json);
}

/// @nodoc
mixin _$UserClassData {
  String get id => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get profileImageUrl => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserClassDataCopyWith<UserClassData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserClassDataCopyWith<$Res> {
  factory $UserClassDataCopyWith(
          UserClassData value, $Res Function(UserClassData) then) =
      _$UserClassDataCopyWithImpl<$Res, UserClassData>;
  @useResult
  $Res call(
      {String id,
      String userName,
      String profileImageUrl,
      String email,
      String phoneNumber});
}

/// @nodoc
class _$UserClassDataCopyWithImpl<$Res, $Val extends UserClassData>
    implements $UserClassDataCopyWith<$Res> {
  _$UserClassDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? profileImageUrl = null,
    Object? email = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserClassDataCopyWith<$Res>
    implements $UserClassDataCopyWith<$Res> {
  factory _$$_UserClassDataCopyWith(
          _$_UserClassData value, $Res Function(_$_UserClassData) then) =
      __$$_UserClassDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userName,
      String profileImageUrl,
      String email,
      String phoneNumber});
}

/// @nodoc
class __$$_UserClassDataCopyWithImpl<$Res>
    extends _$UserClassDataCopyWithImpl<$Res, _$_UserClassData>
    implements _$$_UserClassDataCopyWith<$Res> {
  __$$_UserClassDataCopyWithImpl(
      _$_UserClassData _value, $Res Function(_$_UserClassData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? profileImageUrl = null,
    Object? email = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$_UserClassData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserClassData implements _UserClassData {
  const _$_UserClassData(
      {required this.id,
      required this.userName,
      required this.profileImageUrl,
      required this.email,
      required this.phoneNumber});

  factory _$_UserClassData.fromJson(Map<String, dynamic> json) =>
      _$$_UserClassDataFromJson(json);

  @override
  final String id;
  @override
  final String userName;
  @override
  final String profileImageUrl;
  @override
  final String email;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'UserClassData(id: $id, userName: $userName, profileImageUrl: $profileImageUrl, email: $email, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserClassData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userName, profileImageUrl, email, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserClassDataCopyWith<_$_UserClassData> get copyWith =>
      __$$_UserClassDataCopyWithImpl<_$_UserClassData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserClassDataToJson(
      this,
    );
  }
}

abstract class _UserClassData implements UserClassData {
  const factory _UserClassData(
      {required final String id,
      required final String userName,
      required final String profileImageUrl,
      required final String email,
      required final String phoneNumber}) = _$_UserClassData;

  factory _UserClassData.fromJson(Map<String, dynamic> json) =
      _$_UserClassData.fromJson;

  @override
  String get id;
  @override
  String get userName;
  @override
  String get profileImageUrl;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_UserClassDataCopyWith<_$_UserClassData> get copyWith =>
      throw _privateConstructorUsedError;
}
