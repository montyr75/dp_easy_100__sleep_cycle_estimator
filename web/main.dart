library sleep_cycle_estimator.web.main;

import 'package:angular2/angular2.dart';
import 'package:angular2/bootstrap.dart';
import 'package:logging/logging.dart';
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:sleep_cycle_estimator/model/global.dart';
import 'package:sleep_cycle_estimator/views/main_app/main_app.dart';

main() async {
  initLog();
  await initPolymer();

  bootstrap(MainApp, [provide(Logger, useValue: initLog())]);
}
