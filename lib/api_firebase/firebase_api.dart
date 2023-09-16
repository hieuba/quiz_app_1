import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  // create an instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;
  // fuction to initialize notifications
  Future<void> initNotification() async {
    // Check the platform
    if (defaultTargetPlatform == TargetPlatform.android) {
      // Only request permission and fetch FCM Token on Android
      await _firebaseMessaging.requestPermission();

      // Handle incoming messages when the app is in the foreground
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // handle message here
        print('Message received in foregroud: ${message.data}');
        Builder(
          builder: (context) {
            return Container(color: Colors.amber, height: 299, width: 300);
          },
        );
      });
      // Handle incoming messages when the app is in the background
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        // handle message here
        print('Message received in background: ${message.data}');
      });

      // Handle terminated app state
      RemoteMessage? initialMessage =
          await _firebaseMessaging.getInitialMessage();
      if (initialMessage != null) {
        // Handle message here

        print(
            'Message received when app was terminated: ${initialMessage.data}');
      }

      final FCMToken = await _firebaseMessaging.getToken();
      print('Token $FCMToken');
    }
  }
}
