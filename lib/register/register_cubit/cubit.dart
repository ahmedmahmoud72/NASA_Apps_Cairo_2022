import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_space_apps_2022/register/register_cubit/states.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static  RegisterCubit get(context) => BlocProvider.of(context);


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopRegChangePasswordVisibilityState());
  }
}