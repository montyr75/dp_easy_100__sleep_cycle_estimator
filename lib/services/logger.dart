library lib.services.logger;

import 'package:logging/logging.dart';
import 'package:intl/intl.dart' show DateFormat;

Logger initLog(String appName, Level logLevel) {
  DateFormat dateFormatter = new DateFormat("H:m:s.S");

  Logger.root.level = logLevel;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name} (${dateFormatter.format(rec.time)}): ${rec.message}');
  });

  return new Logger(appName);
}