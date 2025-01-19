import 'package:apiproject/chat/Api/linkapi.dart';
import 'package:apiproject/chat/Api/service/notifications.dart';
import 'package:apiproject/chat/pusher/pusher.dart';
import 'package:apiproject/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'add/widget/shared_preferences.dart';
import 'core/helpers/constants.dart';
import 'core/routing/app_router.dart';
import 'doc_app.dart';

const K = TextStyle(
  fontSize: 30,
  color: Color(0xFF01002f),
  fontWeight: FontWeight.bold,
);
const F = TextStyle(
  fontSize: 22,
  color: Color(0xFF88869f),
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachData.casheInitialization();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await initializeLocalNotifications();
  await checkIfLoggedInUser();
  // Get.put(PusherController());
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfLoggedInUser() async {
  String? token = CachData.getData(key: 'access_token');
  if (token != null) {
    AppLink.token = token;
    AppLink.myId = CachData.getData(key: 'user_id');
    Get.put(PusherController());
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
