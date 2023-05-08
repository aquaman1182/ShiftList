import 'package:provider/provider.dart';
import 'package:shift_app/models/db/database_manager.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shift_app/models/repositories/login_repository.dart';
import 'package:shift_app/models/repositories/shift_repository.dart';
import 'package:shift_app/models/repositories/user_repository.dart';
import 'package:shift_app/view_models/bottom_navigation_view_model.dart';
import 'package:shift_app/view_models/login_view_model.dart';
import 'package:shift_app/view_models/shift_view_model.dart';
import 'package:shift_app/view_models/user_view_model.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider<DatabaseManager>(
    create: (_) {
      return DatabaseManager();
    },
  ),
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<DatabaseManager, AuthService>(
    update: (_, dbManager, repo) => AuthService(databaseManager: dbManager),
  ),
  ProxyProvider<DatabaseManager, ShiftRepository>(
    update: (_, dbManager, repo) => ShiftRepository(databaseManager: dbManager),
  ),
  // UserRepositoryを追加
  ProxyProvider<DatabaseManager, UserRepository>(
    update: (_, dbManager, repo) => UserRepository(databaseManager: dbManager),
  ),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<AuthViewModel>(
    create: (context) => AuthViewModel(
      authService: context.read<AuthService>(),
    ),
  ),

  ChangeNotifierProvider<ShiftViewModel>(
    create: (context) => ShiftViewModel(
      shiftRepository: context.read<ShiftRepository>(),
    ),
  ),

  ChangeNotifierProvider<UserViewModel>(
    create: (context) => UserViewModel(
      userRepository: context.read<UserRepository>(),
    ),
  ),

  ChangeNotifierProvider<BottomNavigationModel>(
    create: (_) => BottomNavigationModel(),
  ),
];
