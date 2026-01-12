import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart, // 타임스탬프 출력
  ),
  level: kDebugMode ? Level.debug : Level.warning, // 개발 환경: Debug, 프로덕션: Warning 이상
);
