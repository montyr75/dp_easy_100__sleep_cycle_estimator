library sleep_cycle_estimator.lib.views.main_app;

import 'package:angular2/angular2.dart';

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_input.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';

import 'package:intl/intl.dart';

import '../../directives/paper_input_model.dart';
import '../../model/global.dart';

@Component(selector: 'main-app', encapsulation: ViewEncapsulation.Native,
    templateUrl: 'main_app.html', styleUrls: const ["md_table.css"],
    directives: const [ModelDirective])
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
//    List<String> bedtimes = _calculateBedtimes(alarmTime).map((DateTime bedtime) => timeFormatter.format(bedtime)).toList(growable: false);

    bedtime1 = timeFormatter.format(alarmTime.subtract(new Duration(hours: 9, minutes: 15)));
    bedtime2 = timeFormatter.format(alarmTime.subtract(new Duration(hours: 7, minutes: 45)));
  }

  String get inputValue => _inputValue;

  set inputValue(String inputValue) {
    _newAlarmTime(inputValue);
  }
}

