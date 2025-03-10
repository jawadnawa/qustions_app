import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'brain.dart';
import 'sustainability_solutions_page.dart';
import 'dart:async';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1A237E),
                Color(0xFF0D47A1),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // لوجو التطبيق
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.lightbulb_outline,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'اختبر معلوماتك',
                style: TextStyle(
                  fontSize: 32, // تقليل حجم النص قليلاً لتجنب overflow
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Cairo',
                ),
                textAlign: TextAlign.center, // تحسين توزيع النص
              ),
              SizedBox(height: 40),

              // قائمة الأزرار مع Row مضبوط
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 600, // يمنع التمدد الزائد للأزرار
                      ),
                      child: Row(
                        mainAxisSize:
                            MainAxisSize.min, // يمنع التمدد الزائد لـ Row
                        children: [
                          Expanded(
                            child: _buildMenuCard(
                              context,
                              'ابدأ الاختبار',
                              Icons.play_arrow_rounded,
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DifficultySelectionPage(),
                                ),
                              ),
                              Colors.green,
                            ),
                          ),
                          SizedBox(width: 10), // تقليل المسافة بين الأزرار
                          Expanded(
                            child: _buildMenuCard(
                              context,
                              'الفيديو',
                              Icons.video_library,
                              () => _showVideoDialog(context),
                              Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildMenuCard(
                      context,
                      'الحلول المستدامة',
                      Icons.eco,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SustainabilitySolutionsPage(),
                        ),
                      ),
                      Color.fromARGB(255, 33, 150, 241),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildMenuCard(
  BuildContext context,
  String title,
  IconData icon,
  VoidCallback onTap,
  Color color,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Changed from center
          children: [
            Container(
              padding: EdgeInsets.all(12), // Reduced padding
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 32, // Reduced size
                color: color,
              ),
            ),
            SizedBox(width: 12), // Reduced spacing
            Expanded(
              // Added Expanded
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20, // Reduced font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Cairo',
                ),
                overflow: TextOverflow.ellipsis, // Added overflow handling
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void _showAboutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        'حول التطبيق',
        style: TextStyle(
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'تطبيق تعليمي يهدف إلى زيادة الوعي بالاستدامة البيئية من خلال الأسئلة التفاعلية والمحتوى التعليمي',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'الإصدار 1.0.0',
            style: TextStyle(
              color: Colors.grey,
              fontFamily: 'Cairo',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(
            'حسناً',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 16,
              color: Theme.of(context).primaryColor,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

void _showVideoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const VideoPlayerDialog(),
  );
}

class VideoPlayerDialog extends StatefulWidget {
  const VideoPlayerDialog({super.key});

  @override
  State<VideoPlayerDialog> createState() => _VideoPlayerDialogState();
}

class _VideoPlayerDialogState extends State<VideoPlayerDialog> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isPlaying = true;
  bool _isButtonVisible = false; // متغير لرؤية الزر
  Timer? _hideButtonTimer; // مؤقت لإخفاء الزر

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/intro.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  // دالة لإيقاف الفيديو وإغلاق النافذة
  void _pauseAndPop() {
    _controller.pause();
    Navigator.of(context).pop();
  }

  // دالة التحكم بالزر
  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _isPlaying = !_isPlaying;
      _isButtonVisible = true; // إظهار الزر عند الضغط
    });

    // إعادة ضبط المؤقت
    _hideButtonTimer?.cancel();
    _hideButtonTimer = Timer(const Duration(seconds: 10), () {
      setState(() {
        _isButtonVisible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _pauseAndPop();
        return false;
      },
      child: Dialog(
        backgroundColor: Colors.black.withOpacity(0.7),
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        child: GestureDetector(
          onTap: _pauseAndPop,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // مشغل الفيديو مع إمكانية إظهار الزر بالنقر
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isButtonVisible = true;
                      });
                      _hideButtonTimer?.cancel();
                      _hideButtonTimer = Timer(const Duration(seconds: 1), () {
                        setState(() {
                          _isButtonVisible = false;
                        });
                      });
                    },
                    child: _isInitialized
                        ? VideoPlayer(_controller)
                        : const Center(
                            child:
                                CircularProgressIndicator(color: Colors.white)),
                  ),

                  // زر التحكم (يظهر فقط عند النقر أو الضغط)
                  if (_isInitialized && _isButtonVisible)
                    FloatingActionButton(
                      onPressed: _togglePlayPause,
                      backgroundColor: Colors.black38,
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideButtonTimer?.cancel();
    super.dispose();
  }
}

class DifficultySelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A237E),
              Color(0xFF0D47A1),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        'اختر المستوى',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Cairo',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 40), // للمحاذاة
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDifficultyCard(
                        context,
                        'سهل',
                        'للمبتدئين',
                        Icons.sentiment_satisfied,
                        Colors.green,
                        Difficulty.easy,
                      ),
                      SizedBox(height: 20),
                      _buildDifficultyCard(
                        context,
                        'متوسط',
                        'للمتقدمين',
                        Icons.sentiment_neutral,
                        Colors.orange,
                        Difficulty.medium,
                      ),
                      SizedBox(height: 20),
                      _buildDifficultyCard(
                        context,
                        'صعب',
                        'للخبراء',
                        Icons.sentiment_very_satisfied,
                        Colors.red,
                        Difficulty.hard,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDifficultyCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    Difficulty difficulty,
  ) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizPage(difficulty: difficulty),
        ),
      ),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Icon(
                icon,
                size: 50,
                color: color,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: color,
              ),
            ),
          ],
        ),
      ),
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
  String? _selectedAnswer;
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
        await _audioPlayer.play(AssetSource('sounds/wrong.wav'));
      }
    } catch (e) {
      debugPrint('Error playing sound: $e');
    }
  }

  void _checkAnswer(String selectedAnswer) async {
    if (_hasAnswered) return;

    setState(() {
      _hasAnswered = true;
      _selectedAnswer = selectedAnswer;
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
        _selectedAnswer = null;
      });
      _saveScore();
    } else {
      setState(() {
        _questionIndex++;
        _hasAnswered = false;
        _selectedAnswer = null;
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
                            _selectedAnswer ==
                                _questions[_questionIndex].correctAnswer
                        ? 'إجابة صحيحة!'
                        : 'إجابة خاطئة',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _hasAnswered &&
                              _selectedAnswer ==
                                  _questions[_questionIndex].correctAnswer
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  const SizedBox(height: 10),
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Column(
              children: [
                Icon(
                  messageIcon,
                  size: 60,
                  color: messageColor,
                ),
                SizedBox(height: 10),
                Text(
                  'انتهى الاختبار!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'النتيجة النهائية: $_score من ${_questions.length}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  '${percentage.toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: messageColor,
                    fontFamily: 'Cairo',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: messageColor,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context); // إغلاق الـ AlertDialog
                      Navigator.pop(context); // العودة للقائمة الرئيسية
                    },
                    icon: Icon(Icons.home),
                    label: Text(
                      'القائمة الرئيسية',
                      style: TextStyle(fontFamily: 'Cairo'),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context); // إغلاق الـ AlertDialog
                      setState(() {
                        _questionIndex = 0;
                        _score = 0;
                        _hasAnswered = false;
                      });
                    },
                    icon: Icon(Icons.refresh),
                    label: Text(
                      'إعادة الاختبار',
                      style: TextStyle(fontFamily: 'Cairo'),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    });

    return Container(); // إرجاع container فارغ لأننا نستخدم AlertDialog
  }
}
