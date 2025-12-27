import 'package:flutter/material.dart';
import '../screens/result_screen.dart';
import '../widgets/answer_card.dart';
import '../widgets/progress_indicator.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final List<String> _questions = [
    '사람들과 함께 있을 때 에너지가 충전된다.',
    '계획을 세우는 것이 즉흥적인 것보다 편하다.',
    '결정을 할 때 감정보다 논리를 우선한다.',
  ];

  final List<List<String>> _answers = [
    ['매우 그렇다', '보통이다', '전혀 아니다'],
    ['매우 그렇다', '보통이다', '전혀 아니다'],
    ['매우 그렇다', '보통이다', '전혀 아니다'],
  ];

  int _currentIndex = 0;
  final Map<int, String> _selectedAnswers = {};

  void _onAnswerSelected(String answer) {
    _selectedAnswers[_currentIndex] = answer;

    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            answers: _selectedAnswers,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('질문'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProgressIndicatorWidget(
              current: _currentIndex + 1,
              total: _questions.length,
            ),
            const SizedBox(height: 32),
            Text(
              _questions[_currentIndex],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            ..._answers[_currentIndex].map(
              (answer) => AnswerCard(
                label: answer,
                onTap: () => _onAnswerSelected(answer),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
