import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/constants/my_colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);
  Color myColor = MyColors.myColor;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return
          SafeArea(
            child: Scaffold(
              body: cubit.bottomScreens[cubit.currentIndex],
              bottomNavigationBar: CurvedNavigationBar(
                animationDuration: const Duration(milliseconds: 500),
                backgroundColor: myColor,
                onTap: (index) {
                  cubit.changeBottom(index);
                },
                items: const [
                  Icon(
                    (Icons.text_fields),
                  ),
                  Icon(
                    (Icons.find_in_page_rounded),
                  ),
                  Icon(
                    (Icons.person),
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}
