import 'package:flutter/material.dart';

class SustainabilitySolutionsPage extends StatelessWidget {
  const SustainabilitySolutionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.green.shade100,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        _buildHeaderCard(),
                        const SizedBox(height: 20),
                        _buildSolutionCard(
                          context,
                          'التغير المناخي وارتفاع درجات الحرارة العالمية',
                          'يؤدي انبعاث الغازات الدفيئة الناتجة عن الأنشطة البشرية، مثل حرق الوقود الأحفوري وإزالة الغابات، إلى ارتفاع درجات الحرارة العالمية. هذا يؤدي إلى ذوبان الجليد القطبي، وارتفاع مستويات البحار، وزيادة الظواهر الجوية المتطرفة مثل الأعاصير والفيضانات والجفاف.',
                          'للتخفيف من التغير المناخي، يجب التحول إلى مصادر الطاقة المتجددة مثل الطاقة الشمسية وطاقة الرياح، وزيادة كفاءة استهلاك الطاقة، وتقليل انبعاثات الكربون من خلال وسائل نقل أكثر استدامة، وزراعة الأشجار لاستيعاب ثاني أكسيد الكربون، بالإضافة إلى وضع سياسات بيئية صارمة للحد من التلوث الصناعي.',
                          Icons.thermostat,
                          Colors.red,
                        ),
                        _buildSolutionCard(
                          context,
                          'تلوث المياه ونقص الموارد المائية',
                          'تعاني العديد من الدول من نقص في المياه العذبة بسبب الجفاف، والتغير المناخي، وسوء إدارة الموارد المائية. كما أن التلوث الناجم عن النفايات الصناعية، والزراعية، والبلاستيكية يجعل مصادر المياه غير صالحة للاستخدام، مما يهدد صحة الإنسان والكائنات الحية.',
                          'يجب تحسين إدارة المياه من خلال تقنيات إعادة التدوير وتحلية مياه البحر، وتشجيع استخدام أنظمة الري الفعالة في الزراعة، وتقليل استخدام المواد الكيميائية التي تلوث المياه، وتوعية المجتمعات حول أهمية ترشيد استهلاك المياه، وفرض قوانين صارمة لمنع تلوث المياه من المصانع والمزارع.',
                          Icons.water_drop,
                          Colors.blue,
                        ),
                        _buildSolutionCard(
                          context,
                          'إزالة الغابات والتصحر',
                          'تتسبب إزالة الغابات في فقدان التنوع البيولوجي، وتفاقم تغير المناخ، وتقليل قدرة الأرض على امتصاص ثاني أكسيد الكربون. كما أن التصحر الناجم عن إزالة الأشجار يهدد الأمن الغذائي ويؤثر على المجتمعات التي تعتمد على الزراعة في معيشتها.',
                          'يمكن الحد من إزالة الغابات عبر تعزيز التشجير وإعادة زراعة الأشجار، وفرض قوانين تمنع القطع العشوائي للغابات، وتشجيع الممارسات الزراعية المستدامة، ودعم المجتمعات المحلية لاستخدام أساليب أكثر استدامة في الزراعة واستخراج الموارد الطبيعية.',
                          Icons.forest,
                          Colors.green,
                        ),
                        _buildSolutionCard(
                          context,
                          'التلوث البلاستيكي وتأثيره على البيئة البحرية',
                          'ينتهي جزء كبير من النفايات البلاستيكية في المحيطات، حيث يقتل الحياة البحرية ويؤثر على النظم البيئية المائية. يتحلل البلاستيك إلى جزيئات صغيرة تُعرف بالميكروبلاستيك، والتي تدخل في السلسلة الغذائية، مما يؤثر على صحة الإنسان والحيوانات.',
                          'يجب تقليل استخدام البلاستيك من خلال حظر الأكياس البلاستيكية ذات الاستخدام الواحد، وتشجيع إعادة التدوير، وتطوير بدائل صديقة للبيئة مثل البلاستيك القابل للتحلل، وإطلاق حملات لتنظيف المحيطات والشواطئ، وزيادة الوعي العام حول مخاطر التلوث البلاستيكي.',
                          Icons.water,
                          Colors.cyan,
                        ),
                        _buildSolutionCard(
                          context,
                          'الاستهلاك المفرط للموارد الطبيعية',
                          'يؤدي الاستهلاك المفرط للموارد مثل المياه، الطاقة، المعادن، والأخشاب إلى استنزاف الأرض وزيادة التلوث. هذا النمط الاستهلاكي غير المستدام يجعل من الصعب تلبية احتياجات الأجيال القادمة ويزيد من الضغوط البيئية.',
                          'يجب تبني أنماط استهلاكية أكثر استدامة من خلال دعم الاقتصاد الدائري، الذي يركز على إعادة التدوير وإعادة الاستخدام بدلاً من الهدر، وتشجيع المنتجات المصنوعة من مواد مستدامة، وتحفيز الشركات على تبني سياسات إنتاج صديقة للبيئة، وتوعية الأفراد حول أهمية تقليل الهدر والاستهلاك غير الضروري.',
                          Icons.recycling,
                          Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.green),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const Expanded(
            child: Text(
              'الحلول المستدامة',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontFamily: 'Cairo',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 48), // للمحاذاة
        ],
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.green.shade300,
            Colors.green.shade500,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -50,
            top: -50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'معاً نحو مستقبل مستدام',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Cairo',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'اكتشف كيف يمكنك المساهمة في حماية البيئة',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9),
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSolutionCard(
    BuildContext context,
    String title,
    String problem,
    String solution,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Row(
                  children: [
                    Icon(icon, color: color),
                    const SizedBox(width: 8),
                    Expanded(child: Text(title)),
                  ],
                ),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'المشكلة:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(problem),
                      const SizedBox(height: 16),
                      const Text(
                        'الحل:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(solution),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('إغلاق'),
                  ),
                ],
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    icon,
                    size: 30,
                    color: color,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'انقر لمعرفة المزيد',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: color.withOpacity(0.5),
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
