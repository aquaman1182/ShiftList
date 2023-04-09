import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserClassData with _$UserClassData {
  factory UserClassData({
    required String email,
    required String name,
    required String uid,
  }) = _UserClassData;
	
  factory UserClassData.fromJson(Map<String, dynamic> json) =>
			_$UserClassDataFromJson(json);
}
