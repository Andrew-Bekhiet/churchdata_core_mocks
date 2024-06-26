// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:churchdata_core/churchdata_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications_platform_interface/flutter_local_notifications_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:timezone/timezone.dart';

class FakeNotificationsService extends NotificationsService {
  factory FakeNotificationsService() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler(
      'dev.fluttercommunity.plus/android_alarm_manager',
      (_) async => const JSONMessageCodec().encodeMessage([true]),
    );

    GetIt.I.registerSingleton<FlutterLocalNotificationsPlugin>(
      FakeFlutterLocalNotificationsPlugin(),
    );

    return FakeNotificationsService._();
  }

  FakeNotificationsService._();

  @override
  Future<bool> registerFCMToken({String? cachedToken}) async {
    return true;
  }
}

class MockNotificationsService extends Mock implements NotificationsService {
  @override
  Future<bool> schedulePeriodic(
    Duration? duration,
    int? id,
    Function? callback, {
    DateTime? startAt,
    bool allowWhileIdle = false,
    bool exact = false,
    bool wakeup = false,
    bool rescheduleOnReboot = false,
  }) =>
      super.noSuchMethod(
          Invocation.method(#schedulePeriodic, [
            duration,
            id,
            callback
          ], {
            #startAt: startAt,
            #allowWhileIdle: allowWhileIdle,
            #exact: exact,
            #wakeup: wakeup,
            #rescheduleOnReboot: rescheduleOnReboot,
          }),
          returnValue: Future<bool>.value(true)) as Future<bool>;

  @override
  Future<bool> registerFCMToken({String? cachedToken}) async {
    return true;
  }
}

class FakeFlutterLocalNotificationsPlugin
    implements FlutterLocalNotificationsPlugin {
  @override
  Future<void> cancel(int id, {String? tag}) {
    return Future.value();
  }

  @override
  Future<void> cancelAll() {
    return Future.value();
  }

  @override
  Future<NotificationAppLaunchDetails?> getNotificationAppLaunchDetails() {
    return Future.value(
      const NotificationAppLaunchDetails(
        true,
        notificationResponse: NotificationResponse(
            notificationResponseType:
                NotificationResponseType.selectedNotification,
            payload: 'NotificationId'),
      ),
    );
  }

  @override
  Future<bool?> initialize(
    InitializationSettings initializationSettings, {
    DidReceiveNotificationResponseCallback? onDidReceiveNotificationResponse,
    DidReceiveBackgroundNotificationResponseCallback?
        onDidReceiveBackgroundNotificationResponse,
  }) async {
    return Future.value(true);
  }

  @override
  Future<List<PendingNotificationRequest>> pendingNotificationRequests() {
    return Future.value([]);
  }

  @override
  Future<void> periodicallyShow(
    int id,
    String? title,
    String? body,
    RepeatInterval repeatInterval,
    NotificationDetails notificationDetails, {
    String? payload,
    @Deprecated('Deprecated in favor of the androidScheduleMode parameter')
    bool androidAllowWhileIdle = false,
    AndroidScheduleMode? androidScheduleMode,
  }) {
    return Future.value();
  }

  @override
  T? resolvePlatformSpecificImplementation<
      T extends FlutterLocalNotificationsPlatform>() {
    return null;
  }

  @override
  Future<void> show(int id, String? title, String? body,
      NotificationDetails? notificationDetails,
      {String? payload}) {
    return Future.value();
  }

  @override
  Future<void> zonedSchedule(
    int id,
    String? title,
    String? body,
    TZDateTime scheduledDate,
    NotificationDetails notificationDetails, {
    required UILocalNotificationDateInterpretation
        uiLocalNotificationDateInterpretation,
    @Deprecated('Deprecated in favor of the androidScheduleMode parameter')
    bool androidAllowWhileIdle = false,
    AndroidScheduleMode? androidScheduleMode,
    String? payload,
    DateTimeComponents? matchDateTimeComponents,
  }) {
    return Future.value();
  }

  @override
  Future<List<ActiveNotification>> getActiveNotifications() async {
    return [];
  }

  @override
  Future<void> periodicallyShowWithDuration(
    int id,
    String? title,
    String? body,
    Duration repeatDurationInterval,
    NotificationDetails notificationDetails, {
    AndroidScheduleMode androidScheduleMode = AndroidScheduleMode.exact,
    String? payload,
  }) async {}
}

class FakeFlutterLocalNotificationsPlatform
    extends FlutterLocalNotificationsPlatform {}
