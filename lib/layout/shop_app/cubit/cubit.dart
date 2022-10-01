import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_space_apps_2022/layout/shop_app/cubit/states.dart';

import '../../../modules/analytical_screen/analytical.dart';
import '../../../modules/key_words_screen/key_words.dart';
import '../../../modules/profile_screen/profile.dart';
import '../../../modules/summerization_screen/summerization.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreens = [
     Summarization(),
     KeyWordsScreen(),
     const ProfileScreen(),
  ];
  void changeBottom(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }
}
