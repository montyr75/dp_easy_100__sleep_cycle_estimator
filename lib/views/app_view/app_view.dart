library app_view;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../../model/global.dart';
import 'package:intl/intl.dart';

@CustomTag('app-view')
class AppView extends PolymerElement {

  // initialize system log
  bool _logInitialized = initLog();

  // UI output
  @observable String bedtime1;
  @observable String bedtime2;

  DateFormat timeFormatter = new DateFormat("h:mm a");

  AppView.created() : super.created();

  @override void attached() {
    super.attached();
    log.info("$runtimeType::attached()");

    newAlarmTime(null, null, $['time_inp']);
  }

  void newAlarmTime(Event event, var detail, InputElement target) {
    log.info("$runtimeType::newAlarmTime(): ${target.value}");

    if (target.value.isEmpty) {
      bedtime1 = bedtime2 = "";
      return;
    }

    DateTime alarmTime = DateTime.parse("2014-01-01 ${target.value}");
    List<String> bedtimes = calculateBedtimes(alarmTime).map((DateTime bedtime) => timeFormatter.format(bedtime)).toList(growable: false);

    bedtime1 = bedtimes[0];
    bedtime2 = bedtimes[1];
  }

  void submit(Event event, var detail, Element target) {
    // prevent app reload on <form> submission
    event.preventDefault();
  }

  List<DateTime> calculateBedtimes(DateTime alarmTime) {
    List<DateTime> bedtimes = new List<DateTime>(2);

    bedtimes[0] = alarmTime.subtract(new Duration(hours: 9, minutes: 15));
    bedtimes[1] = alarmTime.subtract(new Duration(hours: 7, minutes: 45));

    return bedtimes;
  }
}

