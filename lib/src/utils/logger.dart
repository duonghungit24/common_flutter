import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

//  dùng để xem debug
final Logger commonLogger = Logger(
  printer: PrettyPrinter(dateTimeFormat: DateTimeFormat.dateAndTime),
  level: kReleaseMode ? Level.off : Level.trace,
);
