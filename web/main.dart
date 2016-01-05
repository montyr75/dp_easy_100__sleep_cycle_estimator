library sleep_cycle_estimator.web.main;

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer/polymer.dart';

import 'package:angular2/bootstrap.dart';
import 'package:sleep_cycle_estimator/views/main_app/main_app.dart';

import 'package:sleep_cycle_estimator/model/global.dart';

main() async {
  initLog();
  await initPolymer();
  bootstrap(MainApp);
}
