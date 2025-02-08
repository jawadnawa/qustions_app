import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'brain.dart';
import 'sustainability_solutions_page.dart';

void main() {
  runApp(const SustainabilityApp());
}

class SustainabilityApp extends StatelessWidget {
  const SustainabilityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade300, Colors.green.shade700],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'الاستدامة والبيئة',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                _buildButton(
                  context,
                  'بدء اللعبة',
                  Icons.play_arrow,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DifficultySelectionPage()),
                  ),
                ),
                const SizedBox(height: 20),
                _buildButton(
                  context,
                  'فيديو عن الاستدامة',
                  Icons.video_library,
                  () => _showVideoDialog(context),
                ),
                const SizedBox(height: 20),
                _buildButton(
                  context,
                  'الاستدامة والحلول',
                  Icons.eco,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SustainabilitySolutionsPage(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String text,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.green.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _showVideoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const VideoPlayerDialog(),
    );
  }
}

class VideoPlayerDialog extends StatefulWidget {
  const VideoPlayerDialog({super.key});

  @override
  State<VideoPlayerDialog> createState() => _VideoPlayerDialogState();
}

class _VideoPlayerDialogState extends State<VideoPlayerDialog> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/intro.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
          _controller.play(); // تشغيل الفيديو تلقائياً
          _controller.setLooping(true); // تكرار الفيديو
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: _isInitialized
            ? VideoPlayer(_controller)
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}

class DifficultySelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اختر مستوى الصعوبة'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade300, Colors.green.shade700],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDifficultyButton(
                context,
                'سهل',
                Icons.star_border,
                Difficulty.easy,
              ),
              const SizedBox(height: 20),
              _buildDifficultyButton(
                context,
                'متوسط',
                Icons.star_half,
                Difficulty.medium,
              ),
              const SizedBox(height: 20),
              _buildDifficultyButton(
                context,
                'صعب',
                Icons.star,
                Difficulty.hard,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDifficultyButton(
    BuildContext context,
    String text,
    IconData icon,
    Difficulty difficulty,
  ) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        backgroundColor: Colors.green.shade800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizPage(difficulty: difficulty),
          ),
        );
      },
    );
  }
}

class QuizPage extends StatefulWidget {
  final Difficulty difficulty;

  const QuizPage({Key? key, required this.difficulty}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final QuizBrain _quizBrain = QuizBrain();
  late List<Question> _questions;
  int _questionIndex = 0;
  int _score = 0;
  bool _hasAnswered = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _questions = _quizBrain.getQuestionsByDifficulty(widget.difficulty);
    _questions.shuffle();
  }

  Future<void> _playSound(bool correct) async {
    try {
      if (correct) {
        await _audioPlayer.play(AssetSource('sounds/correct.mp3'));
      } else {
        await _audioPlayer.play(AssetSource('sounds/wrong.mp3'));
      }
    } catch (e) {
      debugPrint('Error playing sound: $e');
    }
  }

  void _checkAnswer(String selectedAnswer) async {
    if (_hasAnswered) return;

    setState(() {
      _hasAnswered = true;
    });

    bool isCorrect = selectedAnswer == _questions[_questionIndex].correctAnswer;
    if (isCorrect) {
      _score++;
    }

    await _playSound(isCorrect);
  }

  void _nextQuestion() {
    if (_questionIndex >= _questions.length - 1) {
      setState(() {
        _questionIndex = _questions.length;
        _hasAnswered = false;
      });
      _saveScore();
    } else {
      setState(() {
        _questionIndex++;
        _hasAnswered = false;
      });
    }
  }

  Future<void> _saveScore() async {
    final prefs = await SharedPreferences.getInstance();
    final highScore = prefs.getInt('highScore') ?? 0;
    if (_score > highScore) {
      await prefs.setInt('highScore', _score);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade700, Colors.green.shade900],
          ),
        ),
        child: SafeArea(
          child: _questionIndex >= _questions.length
              ? _buildResultScreen()
              : _buildQuestionScreen(),
        ),
      ),
    );
  }

  Widget _buildQuestionScreen() {
    if (_questionIndex >= _questions.length) {
      return _buildResultScreen();
    }

    final question = _questions[_questionIndex];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'السؤال ${_questionIndex + 1} من ${_questions.length}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      question.question,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView.builder(
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                final option = question.options[index];
                final isSelected =
                    _hasAnswered && option == question.correctAnswer;
                final hasAnswered = _hasAnswered;
                final isCorrect = option == question.correctAnswer;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: ElevatedButton(
                      onPressed:
                          hasAnswered ? null : () => _checkAnswer(option),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        backgroundColor:
                            _getOptionColor(isSelected, hasAnswered, isCorrect),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: isSelected ? 8 : 4,
                      ),
                      child: Text(
                        option,
                        style: TextStyle(
                          fontSize: 18,
                          color: hasAnswered && (isSelected || isCorrect)
                              ? Colors.white
                              : Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_hasAnswered) ...[
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    _hasAnswered &&
                            _questions[_questionIndex].correctAnswer ==
                                _questions[_questionIndex].options.first
                        ? 'إجابة صحيحة!'
                        : 'إجابة خاطئة',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _hasAnswered &&
                              _questions[_questionIndex].correctAnswer ==
                                  _questions[_questionIndex].options.first
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    question.explanation,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      _questionIndex < _questions.length - 1
                          ? 'السؤال التالي'
                          : 'إنهاء الاختبار',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getOptionColor(bool isSelected, bool hasAnswered, bool isCorrect) {
    if (!hasAnswered) {
      return isSelected ? Colors.green.shade100 : Colors.white;
    }
    if (isCorrect) {
      return Colors.green.shade500;
    }
    if (isSelected) {
      return Colors.red.shade400;
    }
    return Colors.white.withOpacity(0.7);
  }

  Widget _buildResultScreen() {
    final percentage = (_score / _questions.length) * 100;
    String message;
    Color messageColor;
    IconData messageIcon;

    if (percentage >= 90) {
      message = 'ممتاز! أنت خبير في الاستدامة';
      messageColor = Colors.green;
      messageIcon = Icons.star;
    } else if (percentage >= 70) {
      message = 'جيد جداً! معرفتك بالاستدامة رائعة';
      messageColor = Colors.blue;
      messageIcon = Icons.thumb_up;
    } else if (percentage >= 50) {
      message = 'جيد! تحتاج لمعرفة المزيد عن الاستدامة';
      messageColor = Colors.orange;
      messageIcon = Icons.info;
    } else {
      message = 'حاول مرة أخرى! تعلم المزيد عن الاستدامة';
      messageColor = Colors.red;
      messageIcon = Icons.refresh;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            messageIcon,
            size: 80,
            color: messageColor,
          ),
          const SizedBox(height: 24),
          const Text(
            'انتهى الاختبار!',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Text(
            'النتيجة النهائية: $_score من ${_questions.length}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            '${percentage.toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: messageColor,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: messageColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _questionIndex = 0;
                    _score = 0;
                    _hasAnswered = false;
                  });
                },
                icon: const Icon(Icons.refresh),
                label: const Text(
                  'إعادة الاختبار',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.home),
                label: const Text(
                  'الصفحة الرئيسية',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
