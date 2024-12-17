import 'package:flutter/material.dart';

class Qustions {
  String? qustion;
  String? image;
  bool? answer;

  Qustions({required this.qustion, required this.image, required this.answer});
}

void main() {
  runApp(const QuestionsApp());
}

class QuestionsApp extends StatelessWidget {
  const QuestionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ExamPage(),
      routes: {
        '/restart': (context) => const ExamPage(),
      },
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  final List<Qustions> questions = [
    Qustions(
        qustion: "ثمانية هو عدد الكواكب في المجرة الشمسية؟",
        image: "assets/image-1.jpg",
        answer: true),
    Qustions(
        qustion: "هل القطط من اللحميات؟",
        image: "assets/image-2.jpg",
        answer: true),
    Qustions(
        qustion: "هل الصين في قارة آسيا؟",
        image: "assets/image-3.jpg",
        answer: true),
    Qustions(
        qustion: "الأرض مسطحة وليست كروية؟",
        image: "assets/image-4.jpg",
        answer: false),
    Qustions(
        qustion: "هل يجب غسل الخضروات قبل أكلها؟",
        image: "assets/image-5.jpg",
        answer: true),
    Qustions(
        qustion: "الزهرة أقرب كوكب للشمس؟",
        image: "assets/image-6.jpg",
        answer: false),
    Qustions(
        qustion: "هل الدجاج يولد؟", image: "assets/image-7.jpg", answer: false),
  ];

  int questionIndex = 0;
  List<Widget> answerResult = [];
  String message = "";

  void checkAnswer(bool userAnswer) {
    setState(() {
      bool correctAnswer = questions[questionIndex].answer!;

      if (userAnswer == correctAnswer) {
        message = " صح صح كمل الهبل تبعك ههههههه";
        answerResult.add(
          const Icon(
            Icons.thumb_up_alt,
            color: Colors.green,
            size: 40,
          ),
        );
      } else {
        message = "جد من كل عقلك ؟ هههههههه";
        answerResult.add(
          const Icon(
            Icons.thumb_down_alt,
            color: Colors.red,
            size: 40,
          ),
        );
      }

      // الانتقال للسؤال التالي أو إنهاء اللعبة
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EndPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "أسئلة",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // عرض النتائج أعلى الشاشة
            Row(
              children: answerResult,
            ),

            // عرض السؤال والصورة
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Image(
                    image: AssetImage(questions[questionIndex].image!),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    questions[questionIndex].qustion!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // زر "صح"
            Expanded(
              flex: 1,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 37, 0, 248),
                  ),
                ),
                onPressed: () => checkAnswer(true),
                child: const Text(
                  "صح",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // زر "خطأ"
            Expanded(
              flex: 1,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 248, 0, 0),
                  ),
                ),
                onPressed: () => checkAnswer(false),
                child: const Text(
                  "خطأ",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EndPage extends StatelessWidget {
  const EndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("خلصت اللعبة يا محترم"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " مكيف على حالة بلعب لعبة صف أول ههههههه",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/restart');
              },
              child: const Text(
                "جرب مره ثانية ويش خسران",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
