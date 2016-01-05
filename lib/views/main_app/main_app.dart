library sleep_cycle_estimator.lib.views.main_app;

import 'dart:html';

import 'package:angular2/angular2.dart';

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_input.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';

import 'package:intl/intl.dart';

import '../../model/global.dart';

@Component(selector: 'main-app', encapsulation: ViewEncapsulation.Native,
    templateUrl: 'main_app.html', styleUrls: const ["md_table.css"])
class MainApp {

  String _inputValue = "07:00:00";

  String bedtime1;
  String bedtime2;

  DateFormat timeFormatter = new DateFormat("h:mm a");

  MainApp() {
    log.info("$runtimeType()");

    _newAlarmTime(inputValue);
  }

  void _newAlarmTime(String value) {
    log.info("$runtimeType::newAlarmTime(): ${value}");

    if (value.isEmpty) {
      bedtime1 = bedtime2 = "";
      return;
    }

    DateTime alarmTime = DateTime.parse("2015-01-01 ${value}");
    List<String> bedtimes = _calculateBedtimes(alarmTime).map((DateTime bedtime) => timeFormatter.format(bedtime)).toList(growable: false);

    bedtime1 = bedtimes[0];
    bedtime2 = bedtimes[1];
  }

  List<DateTime> _calculateBedtimes(DateTime alarmTime) {
    List<DateTime> bedtimes = new List<DateTime>(2);

    bedtimes[0] = alarmTime.subtract(new Duration(hours: 9, minutes: 15));
    bedtimes[1] = alarmTime.subtract(new Duration(hours: 7, minutes: 45));

    return bedtimes;
  }

  String get inputValue => _inputValue;

  set inputValue(String inputValue) {
    _newAlarmTime(inputValue);
  }
}

