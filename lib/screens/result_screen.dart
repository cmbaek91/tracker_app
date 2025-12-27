import 'package:flutter/material.dart';
import '../services/gpt_service.dart';
import '../services/analytics_service.dart';
import '../domain/result/analysis_result.dart';
import '../widgets/primary_button.dart';

class ResultScreen extends StatefulWidget {
  final Map<int, String> answers;

  const ResultScreen({
    super.key,
    required this.answers,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late final GptService _gptService;
  late final AnalyticsService _analyticsService;

  AnalysisResult? _result;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _gptService = GptService();
    _analyticsService = AnalyticsService();
    _analyze();
  }

  Future<void> _analyze() async {
    try {
      _analyticsService.logEvent('analysis_started');

      final result = await _gptService.analyzeAnswers(widget.answers);

      _analyticsService.logEvent(
        'analysis_completed',
        params: {'type': result.type},
      );

      setState(() {
        _result = result;
        _loading = false;
      });
    } catch (e) {
      _analyticsService.logEvent('analysis_failed');
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_error != null) {
      return Scaffold(
        body: Center(
          child: Text(
            _error!,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    final result = _result!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('결과'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              result.type,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              result.summary,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            PrimaryButton(
              label: '홈으로',
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home',
                  (_) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
