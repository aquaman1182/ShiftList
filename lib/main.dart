import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/firebase_options.dart';
import 'router/router.dart';
import 'di/provider.dart';

  void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final goRouter = createGoRouter();
    runApp(    
      MultiProvider(
        providers: globalProviders,
        child: MyApp(goRouter: goRouter),
      ),
    );
  }

  class MyApp extends StatelessWidget {
    final GoRouter goRouter;

    MyApp({required this.goRouter});
  
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }

}