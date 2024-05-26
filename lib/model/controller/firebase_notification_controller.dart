import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../view_model/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../app_models/product_model.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'Priority_id',
    'priority',
    importance: Importance.high,
    enableLights: true,
    ledColor: AppColor.primary,
    enableVibration: true,
    showBadge: true,
    playSound: true,
  );

  static Future<dynamic> handleBackgroundMessage(RemoteMessage message) async {}

  final _localNotificationPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    await _localNotificationPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidChannel);
    initPushNotifications();
  }

  // Handle Message
  void handleMessage(RemoteMessage? message) {
    log("$message");

    // Push to new screen
  }

  Future<void> initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    _firebaseMessaging.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;

      _localNotificationPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: 'logo',
          )),
          payload: jsonEncode(message.toMap()));
    });
  }

  Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'priority_soft_channel',
      'Priority Soft Channel',
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      showWhen: true,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _localNotificationPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  Future<void> saveOrderToFirebase(List<Product> cartItems) async {
    final order = {
      'items': cartItems.map((item) => item.toMap()).toList(),
      'totalPrice': cartItems.fold(0, (sum, item) => sum + (item.price ?? 0)),
      'timestamp': Timestamp.now(),
    };
    await FirebaseFirestore.instance.collection('orders').add(order);
  }
}
