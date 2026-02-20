import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    await _configureTimeZone();

    const androidSettings = AndroidInitializationSettings('@mipmap/logo_app');

    final darwinCategories = [
      DarwinNotificationCategory(
        'textCategory',
        actions: [
          DarwinNotificationAction.text(
            'text_1',
            'Enviar',
            buttonTitle: 'Enviar',
            placeholder: 'Digite algo',
          ),
        ],
      ),
      DarwinNotificationCategory(
        'plainCategory',
        actions: [
          DarwinNotificationAction.plain('id_1', 'Ação 1'),
          DarwinNotificationAction.plain(
            'id_2',
            'Ação 2',
            options: {DarwinNotificationActionOption.destructive},
          ),
          DarwinNotificationAction.plain(
            'id_3',
            'Abrir App',
            options: {DarwinNotificationActionOption.foreground},
          ),
        ],
      ),
    ];

    final darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      notificationCategories: darwinCategories,
    );

    final initSettings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
      macOS: darwinSettings,
    );

    await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  static Future<void> _configureTimeZone() async {
    tz.initializeTimeZones();
    final location = tz.getLocation('America/Recife');
    tz.setLocalLocation(location);
  }

  static Future<bool?> requestPermissions() async {
    if (Platform.isAndroid) {
      return await _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission();
    }

    if (Platform.isIOS || Platform.isMacOS) {
      return await _plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    }

    return false;
  }

  static void _onNotificationResponse(NotificationResponse response) {
    switch (response.notificationResponseType) {
      case NotificationResponseType.selectedNotification:
        _navigateByPayload(response.payload);
        break;
      case NotificationResponseType.selectedNotificationAction:
        _navigateByPayload(response.payload);
        break;
    }
  }

  @pragma('vm:entry-point')
  static void notificationTapBackground(NotificationResponse response) {
    if (response.input?.isNotEmpty ?? false) {
      debugPrint('Background action input: ${response.input}');
    }
    _navigateByPayload(response.payload);
  }

  static void _navigateByPayload(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      Get.toNamed(payload);
    }
  }

  static Future<void> showNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    final notificationId = Random().nextInt(100) + 1;

    final androidDetails = AndroidNotificationDetails(
      'channel_id',
      'Canal Notificações',
      importance: Importance.max,
      priority: Priority.high,
    );

    final darwinDetails = DarwinNotificationDetails(
      threadIdentifier: 'thread_push',
      categoryIdentifier: 'plainCategory',
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
      macOS: darwinDetails,
    );

    await _plugin.show(notificationId, title, body, details, payload: payload);
  }

  static Future<void> showScheduledNotification({
    required String title,
    required String body,
    required String payload,
    required Duration delay,
  }) async {
    final notificationId = Random().nextInt(100) + 1;

    final androidDetails = AndroidNotificationDetails(
      'channel_id',
      'Canal Notificações',
      importance: Importance.max,
      priority: Priority.high,
    );

    final darwinDetails = DarwinNotificationDetails(
      threadIdentifier: 'thread_push',
      categoryIdentifier: 'plainCategory',
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
      macOS: darwinDetails,
    );

    final location = tz.getLocation('America/Recife');

    final tzDateTime = tz.TZDateTime.now(location).add(delay);

    await _plugin.zonedSchedule(
      notificationId,
      title,
      body,
      tzDateTime,
      details,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      payload: payload,
    );
  }

  static Future<void> showDailyNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    final notificationId = Random().nextInt(100) + 1;

    final androidDetails = AndroidNotificationDetails(
      'channel_id',
      'Canal Notificações',
      importance: Importance.max,
      priority: Priority.high,
    );

    final darwinDetails = DarwinNotificationDetails(
      threadIdentifier: 'thread_push',
      categoryIdentifier: 'plainCategory',
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
      macOS: darwinDetails,
    );

    await _plugin.periodicallyShow(
      notificationId,
      title,
      body,
      RepeatInterval.daily,
      details,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      payload: payload,
    );
  }

  static Future<List<PendingNotificationRequest>>
  getPendingNotifications() async {
    return await _plugin.pendingNotificationRequests();
  }

  static Future<void> cancelNotification(int id) async {
    await _plugin.cancel(id);
  }

  static Future<void> cancelAllNotifications() async {
    await _plugin.cancelAll();
  }
}

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}
