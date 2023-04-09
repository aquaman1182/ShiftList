import 'package:provider/provider.dart';
import 'package:shift_app/models/db/database_manager.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shift_app/models/repositories/login_repository.dart';
import 'package:shift_app/models/repositories/register_repository.dart';
import 'package:shift_app/view_models/login_view_model.dart';
import 'package:shift_app/view_models/register_view_model.dart';

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
    ProxyProvider<DatabaseManager, LoginRepository>(
      update: (_, dbManager, repo) => LoginRepository(databaseManager: dbManager),
    ),
    ProxyProvider<DatabaseManager, RegisterRepository>(
      update: (_, dbManager, repo) =>
          RegisterRepository(databaseManager: dbManager),
    ),
  ];

  List<SingleChildWidget> viewModels = [
    ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(
        loginRepository: context.read<LoginRepository>(),
      ),
    ),
    ChangeNotifierProvider<RegisterViewModel>(
      create: (context) => RegisterViewModel(
        registerRepository: context.read<RegisterRepository>(),
      ),
    ),
  ];