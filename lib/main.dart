import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'common/untils/initializer.dart';
import 'firebase_options.dart';
import 'services/api/dio_provider.dart';
import 'services/repo/common_repository.dart';
import 'widgets/my_app.dart';
import 'package:vibration/vibration.dart';

void main() {
  Initializer(initServices: () async {
    Get.put<dynamic>(CommonRepository(DioProvider.instance()),
        tag: 'commonRepository');
    // SessionRepository _sessionRepository = Get.find<SessionRepository>();
  }).init(()async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpOverrides();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    var initializationSettings;
    if (Platform.isAndroid) {
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
          'high_importance_channel', 'xxxx',
          importance: Importance.max);
      var initializationSettingsAndroid =
      const AndroidInitializationSettings("@mipmap/ic_launcher");
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
          .createNotificationChannel(channel);

      initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
    } else {
      var initializationSettingsIOS = DarwinInitializationSettings();
      initializationSettings =
      InitializationSettings(iOS: initializationSettingsIOS);
    }
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification notification = message.notification!;

      if (notification != null) {

        if (Platform.isAndroid) {
          AndroidNotification androidNotification =
          message.notification!.android!;
          if (androidNotification != null) {
            var androidPlatformChannelSpecifics =
            const AndroidNotificationDetails('high_importance_channel', 'xxxx',
                importance: Importance.max,
                playSound: true,
                showProgress: true,
                priority: Priority.high,
                ticker: 'test ticker');

            var iOSChannelSpecifics = const DarwinNotificationDetails();
            var platformChannelSpecifics = NotificationDetails(
                android: androidPlatformChannelSpecifics,
                iOS: iOSChannelSpecifics);
            Vibration.vibrate(duration: 1000, amplitude: 128);
            await flutterLocalNotificationsPlugin.show(0, notification.title,
                notification.body, platformChannelSpecifics,
                payload: 'test');
          }
        } else if (Platform.isIOS) {
          var iOSChannelSpecifics = const DarwinNotificationDetails();
          var platformChannelSpecifics = NotificationDetails(
              iOS: iOSChannelSpecifics);
          Vibration.vibrate(duration: 1000, amplitude: 128);
          await flutterLocalNotificationsPlugin.show(0, notification.title,
              notification.body, platformChannelSpecifics,
              payload: 'test');
        }
        // var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        //     'channel_ID', 'channel name',
        //     importance: Importance.max,
        //     playSound: true,
        //     showProgress: true,
        //     priority: Priority.high,
        //     ticker: 'test ticker');

        // var iOSChannelSpecifics = const IOSNotificationDetails();
        // var platformChannelSpecifics = NotificationDetails(
        //     android: androidPlatformChannelSpecifics, iOS: iOSChannelSpecifics);
        // Vibration.vibrate(duration: 1000, amplitude: 128);
        // await flutterLocalNotificationsPlugin.show(
        //     0, notification.title, notification.body, platformChannelSpecifics,
        //     payload: 'test');
      } else {
        print('noooooo');
      }
    });

    runApp(const MyApp());
  });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
