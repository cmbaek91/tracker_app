import 'package:flutter/material.dart';
import '../services/gpt_service.dart';
import '../services/analytics_service.dart';
import '../domain/personal/personal_answer.dart';
import '../domain/result/analysis_result.dart';
import '../widgets/primary_button.dart';

class ResultScreen extends StatefulWidget {
  final List<PersonalAnswer> answers;

  const ResultScreen({
    super.key,
    required this.answers,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final _gptService = GptService();
  final _analyticsService = AnalyticsService();

  AnalysisResult? _result;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _analyze();
  }

  Future<void> _analyze() async {
    try {
      _analyticsService.logEvent(
        name: 'analysis_start',
      );

      final result = await _gptService.analyze(
        questions: const [], // 실제 질문은 이후 연결
        answers: widget.answers,
      );

      _analyticsService.logEvent(
        name: 'analysis_completed',
      );

      setState(() {
        _result = result;
        _loading = false;
      });
    } catch (e) {
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
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        body: Center(
          child: Text(_error!, style: const TextStyle(color: Colors.red)),
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
              result.summary,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            PrimaryButton(
              label: '처음으로',
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/',
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
