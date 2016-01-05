library sleep_cycle_estimator.web.main;

import 'dart:html';

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer/polymer.dart';

import 'package:angular2/angular2.dart';
import 'package:angular2/bootstrap.dart';

import 'package:sleep_cycle_estimator/views/main_app/main_app.dart';
import 'package:sleep_cycle_estimator/services/logger.dart';

import 'package:logging/logging.dart';

const String APP_NAME = "sleep_cycle_estimator";

AppMode appMode = window.location.host.contains('localhost') ? AppMode.Develop : AppMode.Production;
OpaqueToken AppNameToken = new OpaqueToken("AppNameToken");

main() async {
  await initPolymer();

  bootstrap(MainApp, [
    provide(AppNameToken, useValue: APP_NAME),
    provide(AppMode, useValue: appMode),
    provide(Logger, useFactory: (AppNameToken, AppMode) => initLog(AppNameToken, AppMode), deps: [AppNameToken, AppMode])
  ]);
}
