import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/gausso_button.dart';
import '../models/question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? _selectedOptionIndex;
  
  final List<Question> _questions = [
    Question(
      id: '1',
      questionText: "Aşağıdakilerden hangisi 'Elma' demektir?",
      options: ['Apple', 'Banana', 'Orange', 'Grape'],
      correctAnswerIndex: 0,
    ),
    Question(
      id: '2',
      questionText: "Aşağıdakilerden hangisi 'Kedi' demektir?",
      options: ['Dog', 'Cat', 'Bird', 'Fish'],
      correctAnswerIndex: 1,
    ),
    Question(
      id: '3',
      questionText: "Aşağıdakilerden hangisi 'Araba' demektir?",
      options: ['Bus', 'Bicycle', 'Car', 'Train'],
      correctAnswerIndex: 2,
    ),
  ];

  final int _currentQuestionIndex = 0;

  void _checkAnswer() {
    if (_selectedOptionIndex == null) return;
    
    final currentQuestion = _questions[_currentQuestionIndex];
    final isCorrect = _selectedOptionIndex == currentQuestion.correctAnswerIndex;
    
    if (isCorrect) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Doğru cevap!'), backgroundColor: AppColors.primaryGreen),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Yanlış cevap!'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with close icon and progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.textDark),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: const LinearProgressIndicator(
                        value: 0.3, // Example progress
                        minHeight: 16.0,
                        backgroundColor: AppColors.greyBorder,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryGreen),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16.0),
            
            // Question text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _questions[_currentQuestionIndex].questionText,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 32.0),
            
            // Options list
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ListView.builder(
                  itemCount: _questions[_currentQuestionIndex].options.length,
                  itemBuilder: (context, index) {
                    final bool isSelected = _selectedOptionIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedOptionIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryBlue.withOpacity(0.1) : Colors.transparent,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: isSelected ? AppColors.primaryBlue : AppColors.greyBorder,
                            width: 2.0,
                          ),
                        ),
                        child: Text(
                          _questions[_currentQuestionIndex].options[index],
                          style: TextStyle(
                            fontSize: 18.0,
                            color: isSelected ? AppColors.primaryBlue : AppColors.textDark,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GaussoButton(
            text: "Kontrol Et",
            color: _selectedOptionIndex != null ? AppColors.primaryGreen : AppColors.greyBorder,
            onPressed: () {
              if (_selectedOptionIndex != null) {
                _checkAnswer();
              }
            },
          ),
        ),
      ),
    );
  }
}
