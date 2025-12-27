import 'dart:async';
import '../error/app_exception.dart';

class AnalyticsService {
  Future<void> logEvent({
    required String name,
    Map<String, Object?>? parameters,
  }) async {
    if (name.isEmpty) {
      throw AppException.validation('이벤트 이름이 비어 있습니다.');
    }

    try {
      await Future.delayed(const Duration(milliseconds: 200));

      // 출시 직전 기준: 콘솔 로그 기반 최소 분석 추적
      // 실제 스토어 배포 시 Firebase/Amplitude 등으로 교체 가능
      // 하지만 이벤트 흐름은 여기서 확정됨
      // ignore: avoid_print
      print('[Analytics] $name ${parameters ?? {}}');
    } catch (e) {
      throw AppException.unknown('Analytics 처리 실패: ${e.toString()}');
    }
  }
}
