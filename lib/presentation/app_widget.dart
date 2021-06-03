import 'package:demo/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  final appRouter = new AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Demo App',
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}