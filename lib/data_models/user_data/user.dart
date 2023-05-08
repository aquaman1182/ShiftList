import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserClassData with _$UserClassData {
  const factory UserClassData({
    required String userId,
    required String userName,
    required String profileImageUrl,
    required String email,
    required String phoneNumber,
  }) = _UserClassData;

  factory UserClassData.fromJson(Map<String, dynamic> json) => _$UserClassDataFromJson(json);

  factory UserClassData.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserClassData.fromJson({
      'uid': doc.id,
      ...data,
    });
  }
}