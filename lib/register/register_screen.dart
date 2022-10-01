import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_space_apps_2022/modules/login/login_screen.dart';
import 'package:nasa_space_apps_2022/register/register_cubit/cubit.dart';
import 'package:nasa_space_apps_2022/register/register_cubit/states.dart';

import '../shared/components/components.dart';


class RegisterScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state)
        {},
        builder: (context, state)
        {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Register now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultTFF(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your name';
                            }
                          },
                          labelText: 'User Name',
                          prefixIcon: Icons.person,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultTFF(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String ?value) {
                            if (value!.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          labelText: 'Email Address',
                          prefixIcon: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultTFF(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: RegisterCubit.get(context).suffix,
                          onFieldSubmitted: (value)
                          {

                          },
                          isPassword: RegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validator: (String ?value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          labelText: 'Password',
                          prefixIcon: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultTFF(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (String ?value) {
                            if (value!.isEmpty) {
                              return 'please enter your phone number';
                            }
                          },
                          labelText: 'Phone',
                          prefixIcon: Icons.phone,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ), defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                               navigateTo(context, const LoginScreen());
                              }
                            },
                            text: 'REGISTER')
                ]
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}