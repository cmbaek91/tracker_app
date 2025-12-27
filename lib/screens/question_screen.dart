import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/question_state.dart';
import '../screens/result_screen.dart';
import '../widgets/progress_indicator.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionState>(
      builder: (context, state, _) {
        if (state.isCompleted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => ResultScreen(
                  answers: state.answers,
                ),
              ),
            );
          });
          return const SizedBox.shrink();
        }

        final question = state.currentQuestion;
        if (question == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

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
                  current: state.currentIndex + 1,
                  total: state.totalCount,
                ),
                const SizedBox(height: 32),
                Text(
                  question.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed:
                      state.isSubmitting ? null : () => state.submitAnswer(1),
                  child: const Text('예'),
                ),
                ElevatedButton(
                  onPressed:
                      state.isSubmitting ? null : () => state.submitAnswer(0),
                  child: const Text('아니오'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
