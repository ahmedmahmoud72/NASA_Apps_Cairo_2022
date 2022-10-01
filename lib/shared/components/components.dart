import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nasa_space_apps_2022/shared/constants/my_colors.dart';

Widget defaultButton(
    {double width = double.infinity,
      Color? color ,
      required Function function,
      required String text}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),

        color: MyColors.myColor,

      ),
      width: width,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget defaultTFF({
  required String labelText,
  required TextInputType keyboardType,
  required TextEditingController controller,
  required IconData prefixIcon,
  IconData? suffixIcon,
  required Function validator,
  Function? onFieldSubmitted,
  Function? onChanged,
  bool isPassword = false,
  Function? suffixPressed,
  Color cursorColor = Colors.black,
  Function()? onTap,
}) =>
    TextFormField(
      cursorColor: cursorColor,
      obscureText: isPassword,
      // onChanged: (value)
      // {
      //   onChanged!(value);
      // },
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          prefixIcon: Icon(prefixIcon),
          suffixIcon: IconButton(
            icon: (Icon(suffixIcon)),
            onPressed: () {
              suffixPressed!();
            },
          ),
          labelText: labelText),
      validator: (value) {
        return validator(value);
      },
      onFieldSubmitted: (value) {
        onFieldSubmitted!(value);
      },
      // onTap: () {
      //   onTap!();
      // }
    );


Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0),
  child: Container(
    color: Colors.grey,
    height: 2,
  ),
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateToAndKill(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false);


Widget textButton({required Function onPressed, required String name}) =>
    TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(name,style: TextStyle(color: MyColors.myColor)),

    );

void showToast({
  required String message,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: changeToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { success, error, warning } // when i have more than 1 choice

Color? changeToastColor(ToastStates state) {
  Color? color;

  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}
