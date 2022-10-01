import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_space_apps_2022/modules/splash_screen/splash_screen.dart';
import 'package:nasa_space_apps_2022/shared/bloc_observer.dart';
import 'package:nasa_space_apps_2022/shared/network/remote/dio_helper.dart';
import 'layout/shop_app/cubit/cubit.dart';
import 'layout/shop_app/cubit/states.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return   const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen()
          );
        },
      ),
    );
  }
}