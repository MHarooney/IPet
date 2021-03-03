import 'package:flutter/material.dart';
import 'package:ipet/data/datasource/api_repository_impl.dart';
import 'package:ipet/data/datasource/local_repository_impl.dart';
import 'package:ipet/domain/repository/api_repository.dart';
import 'package:ipet/domain/repository/local_storage_repository.dart';
import 'package:ipet/presentation/provider/home/cart/cart_bloc.dart';
import 'package:ipet/presentation/provider/main_bloc.dart';
import 'package:ipet/presentation/provider/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class MainCleanArchitectureProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiRepositoryInterface>(
          create: (_) => ApiRepositoryImpl(),
        ),
        Provider<LocalRepositoryInterface>(
          create: (_) => LocalRepositoryImpl(),
        ),
        ChangeNotifierProvider(
          create: (context) {
            return MainBLoC(
              localRepositoryInterface:
                  context.read<LocalRepositoryInterface>(),
            )..loadTheme();
          },
        ),
        ChangeNotifierProvider(
          create: (_) => CartBLoC(),
        )
      ],
      child: Builder(builder: (newContext) {
        return Consumer<MainBLoC>(
          builder: (context, bloc, _) {
            return bloc.currentTheme == null
                ? const SizedBox.shrink()
                : MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: bloc.currentTheme,
                    home: SplashScreen.init(newContext),
                  );
          },
        );
      }),
    );
  }
}
