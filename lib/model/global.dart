library sleep_cycle_estimator.lib.model.global;

import 'package:logging/logging.dart';
import 'package:intl/intl.dart' show DateFormat;

Logger initLog(Level logLevel) {
  DateFormat dateFormatter = new DateFormat("H:m:s.S");

  Logger.root.level = logLevel;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name} (${dateFormatter.format(rec.time)}): ${rec.message}');
  });

  return new Logger('message_cipher');
}