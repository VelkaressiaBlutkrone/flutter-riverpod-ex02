abstract class AppException implements Exception {
  /// 사용자에게 표시될 예외에 대한 설명 메시지입니다.
  final String message;

  /// 원본 예외 (있는 경우)
  ///
  /// 이 예외를 발생시킨 원본 예외 객체입니다.
  /// 예외를 래핑할 때 사용됩니다.
  final Object? originalException;

  /// 스택 트레이스
  final StackTrace? stackTrace;

  /// AppException 생성자
  ///
  /// [message] 예외 메시지 (필수)
  /// [originalException] 원본 예외 (선택사항)
  /// [stackTrace] 스택 트레이스 (선택사항)
  const AppException(this.message, {this.originalException, this.stackTrace});

  /// 예외를 문자열로 변환
  ///
  /// Returns 예외 메시지를 반환합니다.
  @override
  String toString() => message;
}
