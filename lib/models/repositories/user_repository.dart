import 'package:shift_app/models/db/database_manager.dart';

import '../../data_models/user_data/user.dart';

class UserRepository {
  final DatabaseManager databaseManager;

  UserRepository({required this.databaseManager});
  Future<UserClassData> fetchUserData(String userId) async {
    // 実際には、データベースやAPIからユーザーデータを取得するコードを書くべきです。
    // ここではダミーデータを返します。
    return UserClassData(
      id: userId,
      userName: '拓実',
      profileImageUrl: 'https://example.com/image.jpg',
      email: 'hal.takumi@example.com',
      phoneNumber: '123-456-7890',
    );
  }
}