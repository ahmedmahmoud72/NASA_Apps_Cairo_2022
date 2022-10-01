import 'package:flutter/cupertino.dart';
import '../components/components.dart';
import '../network/local/cache_helper.dart';

void singOut(context, Widget widget) {

  CacheHelper.removeData(
    key: 'token',
  )!
      .then((value) {
    if (value) {
      navigateToAndKill(context, widget);
    }
  });
}

String? token =  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI0ZjRhNTgxZS02MWQ0LTQwMDItOGM1MS01MGM1ZGU4NGYzZDMiLCJpYXQiOjE2NjE0NDI4OTYsImV4cCI6MTY2MTYxNTY5Nn0.r54zwxngO36iE6lt_NI4lk5fiEIP5CpKRFWplGmtpSE';


