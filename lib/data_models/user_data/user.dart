import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserClassData with _$UserClassData {
  const factory UserClassData({
    required String id,
    required String userName,
    required String profileImageUrl,
    required String email,
    required String phoneNumber,
  }) = _UserClassData;

  factory UserClassData.fromJson(Map<String, dynamic> json) => _$UserClassDataFromJson(json);
}