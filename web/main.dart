library sleep_cycle_estimator.web.main;

import 'dart:html';

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer/polymer.dart';

import 'package:angular2/angular2.dart';
import 'package:angular2/bootstrap.dart';

import 'package:sleep_cycle_estimator/views/main_app/main_app.dart';
import 'package:sleep_cycle_estimator/services/logger.dart';

import 'package:logging/logging.dart';

enum AppMode {
  Production,
  Develop
}

main() async {
  await initPolymer();

  bootstrap(MainApp, [
    provide(AppMode, useValue: initAppMode()),
    provide(Level, useFactory: initLogLevel, deps: [AppMode]),
    provide(Logger, useFactory: (level) => initLog(level), deps: [Level])
  ]);
}

AppMode initAppMode() =>
    window.location.host.contains('localhost') ? AppMode.Develop : AppMode.Production;

Level initLogLevel(AppMode mode) =>
    mode == AppMode.Develop ? Level.ALL : Level.WARNING;