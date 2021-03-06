import 'package:angular2/angular2.dart';
import 'package:logging/logging.dart';
import 'package:intl/intl.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_input.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';

@Component(selector: 'main-app',
    encapsulation: ViewEncapsulation.Native,
    templateUrl: 'main_app.html',
    styleUrls: const ["md_table.css"]
)
class MainApp {
  final Logger log;

  String _inputValue = "07:00:00";

  String bedtime1;
  String bedtime2;

  DateFormat timeFormatter = new DateFormat("h:mm a");

  MainApp(Logger this.log) {
    log.info("$runtimeType()");

    _newAlarmTime(inputValue);
  }

  void _newAlarmTime(String value) {
    log.info("$runtimeType::newAlarmTime(): ${value}");

    DateTime alarmTime;

    try {
      alarmTime = DateTime.parse("2016-01-01 ${value}");
    }
    catch (e) {
      bedtime1 = bedtime2 = "";
      return;
    }

    bedtime1 = timeFormatter.format(alarmTime.subtract(new Duration(hours: 9, minutes: 15)));
    bedtime2 = timeFormatter.format(alarmTime.subtract(new Duration(hours: 7, minutes: 45)));
  }

  String get inputValue => _inputValue;
  void set inputValue(String inputValue) => _newAlarmTime(inputValue);
}