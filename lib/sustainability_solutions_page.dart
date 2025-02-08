import 'package:flutter/material.dart';

class SustainabilitySolutionsPage extends StatelessWidget {
  const SustainabilitySolutionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الاستدامة والحلول',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade700, Colors.green.shade900],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            SustainabilityCard(
              title: 'تغير المناخ والاحتباس الحراري',
              problem: '''
يعد تغير المناخ من أخطر التحديات البيئية التي تواجه كوكبنا. حيث يؤدي ارتفاع درجات الحرارة العالمية إلى:
• ذوبان الجليد في القطبين
• ارتفاع مستوى سطح البحر
• تغيرات في أنماط هطول الأمطار
• زيادة في الظواهر المناخية المتطرفة
• تهديد التنوع البيولوجي''',
              traditionalSolution: '''
الحلول التقليدية تشمل:
• تقليل استهلاك الوقود الأحفوري
• زراعة الأشجار وحماية الغابات
• تحسين كفاءة استخدام الطاقة
• استخدام وسائل النقل العام
• تشجيع استخدام الطاقة المتجددة''',
              techSolution: '''
الحلول التقنية المبتكرة:
• استخدام الذكاء الاصطناعي للتنبؤ بالتغيرات المناخية
• تطوير تقنيات احتجاز الكربون وتخزينه
• إنشاء شبكات ذكية لإدارة الطاقة
• تطوير مواد بناء صديقة للبيئة
• استخدام تقنيات النانو في تنقية الهواء''',
              color: Color(0xFF1B5E20),
              icon: Icons.thermostat,
            ),
            SustainabilityCard(
              title: 'التلوث البيئي',
              problem: '''
يشكل التلوث البيئي تهديداً خطيراً للنظم البيئية والصحة العامة:
• تلوث الهواء من المصانع ووسائل النقل
• تلوث المياه بالنفايات الصناعية والبلاستيكية
• تلوث التربة بالمواد الكيميائية
• التلوث الضوضائي في المدن
• التلوث الإشعاعي من النفايات النووية''',
              traditionalSolution: '''
الحلول التقليدية المتبعة:
• فرض قوانين صارمة على المصانع
• معالجة مياه الصرف الصحي
• إعادة تدوير النفايات
• زيادة المساحات الخضراء
• تشجيع استخدام المنتجات العضوية''',
              techSolution: '''
الابتكارات التكنولوجية للحد من التلوث:
• روبوتات ذكية لتنظيف المحيطات
• أنظمة مراقبة جودة الهواء في الوقت الحقيقي
• تقنيات النانو لتنقية المياه
• مرشحات متقدمة للمداخن الصناعية
• تطوير بدائل للبلاستيك قابلة للتحلل''',
              color: Color(0xFF0D47A1),
              icon: Icons.air,
            ),
            SustainabilityCard(
              title: 'استنزاف الموارد الطبيعية',
              problem: '''
يؤدي الاستهلاك المفرط للموارد الطبيعية إلى مشاكل خطيرة:
• نضوب مصادر المياه العذبة
• تدمير الغابات والأراضي الزراعية
• استنزاف مصادر الطاقة غير المتجددة
• فقدان التنوع البيولوجي
• تدهور خصوبة التربة''',
              traditionalSolution: '''
الحلول التقليدية تتضمن:
• ترشيد استهلاك المياه
• حماية المناطق الطبيعية
• تطبيق الزراعة المستدامة
• إعادة تدوير المواد
• تشجيع الاستهلاك المسؤول''',
              techSolution: '''
الحلول التكنولوجية المتقدمة:
• أنظمة ري ذكية تعتمد على الاستشعار
• تقنيات استخراج المياه من الهواء
• زراعة عمودية بتقنيات هيدروبونيك
• تطوير مصادر طاقة متجددة مبتكرة
• استخدام البيانات الضخمة في إدارة الموارد''',
              color: Color(0xFF004D40),
              icon: Icons.water_drop,
            ),
          ],
        ),
      ),
    );
  }
}

class SustainabilityCard extends StatelessWidget {
  final String title;
  final String problem;
  final String traditionalSolution;
  final String techSolution;
  final Color color;
  final IconData icon;

  const SustainabilityCard({
    super.key,
    required this.title,
    required this.problem,
    required this.traditionalSolution,
    required this.techSolution,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 32),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection('المشكلة:', problem, Icons.warning_amber),
                const SizedBox(height: 16),
                _buildSection(
                    'الحلول التقليدية:', traditionalSolution, Icons.eco),
                const SizedBox(height: 16),
                _buildSection(
                    'الحلول التقنية المبتكرة:', techSolution, Icons.lightbulb),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
