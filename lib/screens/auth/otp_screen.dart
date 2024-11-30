import 'package:flutter/material.dart';
import '../home/home_screen.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;

  const OTPScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final List<TextEditingController> _controllers = List.generate(
    5,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // قفل وثلاث نجوم
            const Column(
              children: [
                Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                  size: 50,
                ),
                SizedBox(height: 8),
                Text(
                  '***',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // عنوان
            const Text(
              'الرجاء إدخال كلمة المرور المؤقتة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            // OTP عنوان
            const Text(
              'رمز التحقق OTP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // نص توضيحي مع رقم الجوال المتغير
            Text(
              'تم ارسال OTP الى رقم هاتفك ${widget.phoneNumber}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Cairo',
              ),
            ),
            const Text(
              'ادخل رمز OTP للتأكيد',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: 30),
            // حقول OTP
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _controllers[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 4) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // لم يتم استلام كلمة المرور المؤقتة؟
            TextButton(
              onPressed: () {
                // إعادة إرسال الكود
              },
              child: const Text(
                'إعادة إرسال كلمة المرور المؤقتة',
                style: TextStyle(
                  color: Color(0xFFFFB800),
                  fontFamily: 'Cairo',
                ),
              ),
            ),
            const SizedBox(height: 30),
            // زر التأكيد
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // دمج القيم من الـ controllers
                  String otp =
                      _controllers.map((controller) => controller.text).join();

                  // التحقق من أن الكود يحتوي على 5 أرقام فقط
                  if (otp.isEmpty || otp.length < 5) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('برجاء إدخال كود التحقق كامل'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  // إذا تم إدخال 5 أرقام، نقبل الكود بغض النظر عن صحته
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(
                        userName:
                            'اسم المستخدم', // هنا هيكون الاسم من قاعدة البيانات
                        profileImage:
                            null, // هنا هيكون رابط الصورة من قاعدة البيانات
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFB800),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'تأكيد',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Cairo',
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

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
