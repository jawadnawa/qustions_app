class Question {
  String question;
  List<String> options;
  String correctAnswer;
  String explanation;
  Difficulty difficulty;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
    required this.difficulty,
  });
}

enum Difficulty {
  easy,
  medium,
  hard,
}

class QuizBrain {
  List<Question> getQuestionsByDifficulty(Difficulty difficulty) {
    return questions.where((q) => q.difficulty == difficulty).toList();
  }

  final List<Question> questions = [
    // أسئلة سهلة
    Question(
      question: "ما هو اللون الذي يرمز للبيئة؟",
      options: ["الأخضر", "الأحمر", "الأزرق", "الأصفر"],
      correctAnswer: "الأخضر",
      explanation: "اللون الأخضر يرمز للطبيعة والبيئة",
      difficulty: Difficulty.easy,
    ),
    Question(
      question: "ما هو مصدر ضوء النهار الرئيسي؟",
      options: ["الشمس", "القمر", "النجوم", "المصابيح"],
      correctAnswer: "الشمس",
      explanation: "الشمس هي المصدر الرئيسي للضوء والطاقة على الأرض",
      difficulty: Difficulty.easy,
    ),
    Question(
      question: "ما هو أفضل مكان لزراعة النباتات؟",
      options: ["التربة الخصبة", "الأسفلت", "الرمل", "الصخور"],
      correctAnswer: "التربة الخصبة",
      explanation: "التربة الخصبة غنية بالمغذيات الضرورية لنمو النباتات",
      difficulty: Difficulty.easy,
    ),
    Question(
      question: "ماذا تحتاج النباتات للنمو؟",
      options: ["الماء والضوء", "الظلام فقط", "الماء فقط", "لا شيء"],
      correctAnswer: "الماء والضوء",
      explanation:
          "تحتاج النباتات إلى الماء والضوء للقيام بعملية التمثيل الضوئي",
      difficulty: Difficulty.easy,
    ),
    Question(
      question: "ما هو أفضل مكان لرمي النفايات؟",
      options: ["سلة المهملات", "الشارع", "البحر", "الحديقة"],
      correctAnswer: "سلة المهملات",
      explanation: "سلة المهملات هي المكان المخصص والصحيح للتخلص من النفايات",
      difficulty: Difficulty.easy,
    ),
    Question(
      question: "كيف نحافظ على نظافة البيئة؟",
      options: [
        "عدم رمي النفايات",
        "رمي النفايات",
        "حرق النفايات",
        "دفن النفايات"
      ],
      correctAnswer: "عدم رمي النفايات",
      explanation:
          "الحفاظ على نظافة البيئة يبدأ بعدم رمي النفايات في غير أماكنها",
      difficulty: Difficulty.easy,
    ),
    Question(
      question: "ما هو مصدر الماء العذب الرئيسي؟",
      options: ["الأمطار", "البحر", "المحيط", "البركة"],
      correctAnswer: "الأمطار",
      explanation: "الأمطار هي المصدر الرئيسي للمياه العذبة على الأرض",
      difficulty: Difficulty.easy,
    ),
    Question(
      question: "ما هو أفضل وقت لإطفاء المصابيح؟",
      options: [
        "عند مغادرة الغرفة",
        "في الصباح",
        "في المساء",
        "أثناء النوم فقط"
      ],
      correctAnswer: "عند مغادرة الغرفة",
      explanation: "يجب إطفاء المصابيح عند عدم الحاجة إليها لتوفير الطاقة",
      difficulty: Difficulty.easy,
    ),
    Question(
      question: "ماذا يمكن أن نفعل بالأوراق المستعملة؟",
      options: ["إعادة تدويرها", "حرقها", "رميها", "دفنها"],
      correctAnswer: "إعادة تدويرها",
      explanation: "إعادة تدوير الأوراق يساعد في الحفاظ على البيئة",
      difficulty: Difficulty.easy,
    ),
    Question(
      question: "ما هو أفضل مكان للعب؟",
      options: ["الحديقة", "الشارع", "وسط السيارات", "القمامة"],
      correctAnswer: "الحديقة",
      explanation: "الحديقة مكان آمن ونظيف للعب",
      difficulty: Difficulty.easy,
    ),

    // أسئلة متوسطة
    Question(
      question: "ما هي عملية التمثيل الضوئي؟",
      options: [
        "تحويل ضوء الشمس إلى غذاء",
        "تحويل الماء إلى هواء",
        "تحويل التربة إلى ماء",
        "تحويل الهواء إلى تربة"
      ],
      correctAnswer: "تحويل ضوء الشمس إلى غذاء",
      explanation:
          "التمثيل الضوئي هو عملية تحول فيها النباتات ضوء الشمس إلى طاقة وغذاء",
      difficulty: Difficulty.medium,
    ),
    Question(
      question: "ما هو تأثير إعادة التدوير على البيئة؟",
      options: [
        "تقليل النفايات وحماية الموارد",
        "زيادة التلوث",
        "استهلاك المزيد من الطاقة",
        "تدمير الغابات"
      ],
      correctAnswer: "تقليل النفايات وحماية الموارد",
      explanation:
          "إعادة التدوير تساعد في تقليل النفايات وحماية الموارد الطبيعية",
      difficulty: Difficulty.medium,
    ),
    Question(
      question: "ما هو دور طبقة الأوزون؟",
      options: [
        "حماية الأرض من الأشعة الضارة",
        "تدفئة الأرض",
        "تبريد الأرض",
        "توليد الأمطار"
      ],
      correctAnswer: "حماية الأرض من الأشعة الضارة",
      explanation: "طبقة الأوزون تحمي الأرض من الأشعة فوق البنفسجية الضارة",
      difficulty: Difficulty.medium,
    ),
    Question(
      question: "ما هي أهمية النحل للبيئة؟",
      options: ["تلقيح النباتات", "تنظيف الهواء", "تنقية المياه", "تدفئة الجو"],
      correctAnswer: "تلقيح النباتات",
      explanation: "النحل يساعد في تلقيح النباتات مما يساعد في إنتاج الغذاء",
      difficulty: Difficulty.medium,
    ),
    Question(
      question: "ما هو تأثير البلاستيك على الحياة البحرية؟",
      options: [
        "يؤذي الكائنات البحرية",
        "يغذي الأسماك",
        "ينظف المحيطات",
        "يحمي الشعاب المرجانية"
      ],
      correctAnswer: "يؤذي الكائنات البحرية",
      explanation:
          "البلاستيك يضر بالحياة البحرية ويمكن أن يؤدي إلى موت الكائنات البحرية",
      difficulty: Difficulty.medium,
    ),
    Question(
      question: "ما هو السبب الرئيسي لتلوث الهواء في المدن؟",
      options: [
        "عوادم السيارات",
        "تنفس الإنسان",
        "نمو النباتات",
        "هطول الأمطار"
      ],
      correctAnswer: "عوادم السيارات",
      explanation: "عوادم السيارات تطلق غازات ضارة تلوث الهواء في المدن",
      difficulty: Difficulty.medium,
    ),
    Question(
      question: "كيف يمكن ترشيد استهلاك الكهرباء؟",
      options: [
        "استخدام المصابيح الموفرة للطاقة",
        "تشغيل جميع الأجهزة",
        "ترك المصابيح مضاءة",
        "استخدام أجهزة قديمة"
      ],
      correctAnswer: "استخدام المصابيح الموفرة للطاقة",
      explanation: "المصابيح الموفرة للطاقة تستهلك كهرباء أقل وتدوم لفترة أطول",
      difficulty: Difficulty.medium,
    ),
    Question(
      question: "ما هي فوائد الأشجار للبيئة؟",
      options: [
        "توفير الأكسجين وتنقية الهواء",
        "زيادة التلوث",
        "تقليل الأكسجين",
        "رفع درجة الحرارة"
      ],
      correctAnswer: "توفير الأكسجين وتنقية الهواء",
      explanation: "الأشجار تنتج الأكسجين وتنقي الهواء من الملوثات",
      difficulty: Difficulty.medium,
    ),
    Question(
      question: "ما هو تأثير المطر الحمضي على البيئة؟",
      options: [
        "تدمير النباتات والمباني",
        "تخصيب التربة",
        "تنظيف الهواء",
        "زيادة نمو النباتات"
      ],
      correctAnswer: "تدمير النباتات والمباني",
      explanation: "المطر الحمضي يضر بالنباتات ويسبب تآكل المباني",
      difficulty: Difficulty.medium,
    ),
    Question(
      question: "كيف تؤثر المبيدات الحشرية على البيئة؟",
      options: [
        "تضر بالكائنات المفيدة",
        "تحسن نمو النباتات",
        "تنظف التربة",
        "تحمي البيئة"
      ],
      correctAnswer: "تضر بالكائنات المفيدة",
      explanation: "المبيدات الحشرية تقتل الحشرات المفيدة مثل النحل",
      difficulty: Difficulty.medium,
    ),

    // أسئلة صعبة
    Question(
      question: "ما هو تأثير ظاهرة النينو على المناخ العالمي؟",
      options: [
        "تغيير أنماط الطقس العالمية",
        "تبريد المحيطات فقط",
        "زيادة هطول الثلوج",
        "تقليل مستوى البحر"
      ],
      correctAnswer: "تغيير أنماط الطقس العالمية",
      explanation:
          "ظاهرة النينو تؤثر على درجات الحرارة وأنماط هطول الأمطار حول العالم",
      difficulty: Difficulty.hard,
    ),
    Question(
      question: "ما هو دور الفيتوبلانكتون في النظام البيئي البحري؟",
      options: [
        "إنتاج نصف أكسجين الأرض",
        "تلويث المياه",
        "تدمير الشعاب المرجانية",
        "زيادة حموضة المحيطات"
      ],
      correctAnswer: "إنتاج نصف أكسجين الأرض",
      explanation: "الفيتوبلانكتون مسؤول عن إنتاج حوالي 50% من أكسجين الأرض",
      difficulty: Difficulty.hard,
    ),
    Question(
      question: "ما هو تأثير تحمض المحيطات على النظام البيئي البحري؟",
      options: [
        "تدمير الهياكل الكلسية للكائنات البحرية",
        "زيادة التنوع البيولوجي",
        "تحسين نمو المرجان",
        "زيادة الأسماك"
      ],
      correctAnswer: "تدمير الهياكل الكلسية للكائنات البحرية",
      explanation:
          "تحمض المحيطات يؤثر سلباً على قدرة الكائنات البحرية على بناء هياكلها الكلسية",
      difficulty: Difficulty.hard,
    ),
    Question(
      question: "ما هو تأثير فقدان التنوع الجيني على الأنواع؟",
      options: [
        "ضعف القدرة على التكيف مع التغيرات البيئية",
        "زيادة المقاومة للأمراض",
        "تحسين القدرة على التكاثر",
        "زيادة معدل البقاء"
      ],
      correctAnswer: "ضعف القدرة على التكيف مع التغيرات البيئية",
      explanation:
          "فقدان التنوع الجيني يقلل من قدرة الأنواع على التكيف مع التغيرات البيئية",
      difficulty: Difficulty.hard,
    ),
    Question(
      question: "ما هو تأثير ظاهرة الجزر الحرارية الحضرية؟",
      options: [
        "ارتفاع درجات الحرارة في المدن",
        "تبريد المناطق الحضرية",
        "زيادة المساحات الخضراء",
        "تحسين جودة الهواء"
      ],
      correctAnswer: "ارتفاع درجات الحرارة في المدن",
      explanation:
          "المناطق الحضرية تكون أكثر دفئاً من المناطق المحيطة بسبب البنية التحتية والنشاط البشري",
      difficulty: Difficulty.hard,
    ),
    Question(
      question: "ما هو تأثير تدهور طبقة البيرمافروست على تغير المناخ؟",
      options: [
        "إطلاق غازات الدفيئة المخزنة",
        "تبريد الغلاف الجوي",
        "زيادة التنوع البيولوجي",
        "تحسين خصوبة التربة"
      ],
      correctAnswer: "إطلاق غازات الدفيئة المخزنة",
      explanation:
          "ذوبان البيرمافروست يطلق غازات الدفيئة المخزنة مما يزيد من الاحتباس الحراري",
      difficulty: Difficulty.hard,
    ),
    Question(
      question: "ما هو مفهوم القدرة الاستيعابية البيولوجية؟",
      options: [
        "قدرة النظام البيئي على تجديد الموارد",
        "كمية التلوث في البيئة",
        "عدد السكان في منطقة ما",
        "مساحة الغابات"
      ],
      correctAnswer: "قدرة النظام البيئي على تجديد الموارد",
      explanation:
          "القدرة الاستيعابية البيولوجية هي قدرة النظام البيئي على إنتاج وتجديد الموارد",
      difficulty: Difficulty.hard,
    ),
    Question(
      question: "ما هو تأثير التجزؤ البيئي على التنوع البيولوجي؟",
      options: [
        "عزل المجتمعات وتقليل التنوع الجيني",
        "زيادة التنوع البيولوجي",
        "تحسين الاتصال بين المجتمعات",
        "زيادة المساحة المتاحة للأنواع"
      ],
      correctAnswer: "عزل المجتمعات وتقليل التنوع الجيني",
      explanation:
          "التجزؤ البيئي يؤدي إلى عزل المجتمعات مما يقلل من التنوع الجيني",
      difficulty: Difficulty.hard,
    ),
    Question(
      question: "ما هو مفهوم الخدمات البيئية النظامية؟",
      options: [
        "الفوائد التي تقدمها النظم البيئية للإنسان",
        "تكلفة حماية البيئة",
        "أضرار التلوث البيئي",
        "عدد الأنواع المهددة"
      ],
      correctAnswer: "الفوائد التي تقدمها النظم البيئية للإنسان",
      explanation:
          "الخدمات البيئية النظامية هي المنافع التي يحصل عليها الإنسان من النظم البيئية",
      difficulty: Difficulty.hard,
    ),
    Question(
      question: "ما هو تأثير التغذية الزائدة في النظم المائية؟",
      options: [
        "نمو الطحالب وموت الكائنات المائية",
        "زيادة التنوع البيولوجي",
        "تحسين جودة المياه",
        "زيادة الأكسجين المذاب"
      ],
      correctAnswer: "نمو الطحالب وموت الكائنات المائية",
      explanation:
          "التغذية الزائدة تؤدي إلى نمو مفرط للطحالب مما يستنزف الأكسجين ويضر بالكائنات المائية",
      difficulty: Difficulty.hard,
    ),
  ];
}
