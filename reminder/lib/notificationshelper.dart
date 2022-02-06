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
