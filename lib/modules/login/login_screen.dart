import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_space_apps_2022/modules/home_screen/home_screen.dart';

import '../../register/register_screen.dart';
import '../../shared/components/components.dart';
import '../upload_file/upload_file.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      // بشغل ال cubit بتاعي
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
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
                          const Text(
                            'LOGIN',
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),

                          // لو انا مختار لون من ال theme وعايز اعدل عليه بستخدم copy with.
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            'login in now to browse our hot offers',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          defaultTFF(
                              labelText: 'Email Address',
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              prefixIcon: Icons.email_outlined,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return ('Enter Your Email Please');
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 20.0,
                          ),
                          defaultTFF(
                            isPassword: LoginCubit
                                .get(context)
                                .isPassword,
                            labelText: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            onFieldSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                navigateTo(context, HomeScreen());
                              }
                            },
                            prefixIcon: Icons.lock_outline,
                            suffixIcon: LoginCubit
                                .get(context)
                                .suffix,
                            suffixPressed: () {
                             LoginCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return ('Password Address is required');
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          ConditionalBuilder(
                              fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                              condition: state is! LoginLoadingState,
                              builder: (context) =>
                                  defaultButton(
                                      function: () {
                                        if (formKey.currentState!.validate()) {
                                          navigateTo(context, const UploadFiles());
                                        }
                                      },
                                      text: 'LOGIN')),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("If you don't have an account?"),
                              textButton(
                                  onPressed: () {
                                    navigateTo(context, RegisterScreen());
                                  },
                                  name: 'REGISTER NOW'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
