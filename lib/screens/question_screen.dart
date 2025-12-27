import 'package:flutter/material.dart';
import '../routes.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int? answer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Question')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('나는 아침형 인간이다'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => setState(() => answer = 1),
            child: const Text('예'),
          ),
          ElevatedButton(
            onPressed: () => setState(() => answer = 0),
            child: const Text('아니오'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: answer == null
                ? null
                : () => Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.result,
                    ),
            child: const Text('다음'),
          ),
        ],
      ),
    );
  }
}
