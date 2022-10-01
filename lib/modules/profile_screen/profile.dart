import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/shop_app/app_layout.dart';
import '../../layout/shop_app/cubit/cubit.dart';
import '../../layout/shop_app/cubit/states.dart';
import '../../modules/login/login_screen.dart';
import '../../shared/components/components.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Stack(
                  children:[ SizedBox.expand(
                    child: Image.asset(
                      'assets/images/background_image.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.black26,
                        radius: 20.0,
                        child: IconButton(
                            icon: const Icon(Icons.arrow_back_outlined,
                                size: 20, color: Colors.white70),
                            onPressed: () {
                                navigateTo(context, HomeLayout());

                            }),
                      ),
                    ),
               ] ),
                DraggableScrollableSheet(
                    minChildSize: 0.1,
                    initialChildSize: 0.25,
                    builder: (context, scrollController) => SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height),
                        color: Colors.black54,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(

                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 30,
                                      top: 30,
                                      bottom: 30,
                                    ),
                                    child: SizedBox(
                                      height: 100.0,
                                      width: 100.0,
                                      child: CircleAvatar(
                                        radius: 2.5,
                                        backgroundColor: Colors.black,
                                        child: ClipOval(
                                          child: Image.network(
                                            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Ahmed Mahmoud',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white.withOpacity(0.7)),
                                        ),
                                        const SizedBox(height: 20,),
                                        Text(
                                          'Mobile App Developer',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey.withOpacity(0.7)),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child:
                                Row(
                                  children: [
                                    Icon(Icons.email_outlined,color: Colors.white.withOpacity(0.7),size: 30,),
                                    const SizedBox(width: 10,),
                                    Text(
                                      'ahmedmahmoudyahia72@gmail.com',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(0.5)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child:
                                Row(
                                  children: [
                                    Icon(Icons.phone_android,color: Colors.white.withOpacity(0.7),size: 30,),
                                    const SizedBox(width: 10,),
                                    Text(
                                      '+201097125509',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(0.5)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: defaultButton(function: ()
                                {
                                }, text: 'Edit profile',color: Colors.grey.withOpacity(0.15)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                                child: defaultButton(function: ()
                                {

                                  navigateToAndKill(context, const LoginScreen());
                                }, text: 'LOGOUT',color: Colors.grey.withOpacity(0.15)),
                              ),

                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );


  }
}






























