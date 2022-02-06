import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as notifs;
import 'package:rxdart/subjects.dart' as rxSub;

class NotificationClass {
  final int id;
  final String title;
  final String body;
  final String payload;

  NotificationClass({this.id, this.body, this.payload, this.title});
}

final rxSub.BehaviorSubject<NotificationClass>
    didReceiveLocalNotificationSubject =
    rxSub.BehaviorSubject<NotificationClass>();

final rxSub.BehaviorSubject<String> selectNotificationSubject =
    rxSub.BehaviorSubject<String>();

Future<void> initNotifications(
    notifs.FlutterLocalNotificationsPlugin
        notifsPlugin) async {
  var initializationSettingsAndroid =
      notifs.AndroidInitializationSettings('app_icon');
  var initializationSettingsIOS = notifs.IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {
        didReceiveLocalNotificationSubject
            .add(NotificationClass(id: id, title: title, body: body, payload: payload));
      });