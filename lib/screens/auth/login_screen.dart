import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import './otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isPasswordVisible = false;
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // اللوجو
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 16),
              // النص العربي
              const Text(
                'صالون فور وان للحلاقة',
                style: TextStyle(
                  color: Color(0xFFFFB800),
                  fontSize: 20,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              // عنوان تسجيل الدخول
              const Text(
                'تسجيل الدخول',
                style: TextStyle(
                  color: Color(0xFFFFB800),
                  fontSize: 22,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              // حقل رقم الجوال
              IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'رقم الجوال',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFB800)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFB800)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFB800)),
                  ),
                ),
                initialCountryCode: 'SA',
                style: const TextStyle(color: Colors.white),
                dropdownTextStyle: const TextStyle(color: Colors.white),
                invalidNumberMessage: 'برجاء إدخال رقم صحيح',
                onChanged: (phone) {
                  phoneNumber = phone.completeNumber;
                },
              ),
              const SizedBox(height: 16),
              // حقل كلمة المرور
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'كلمة المرور',
                    labelStyle: const TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFB800)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFB800)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFB800)),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    alignLabelWithHint: true,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                  ),
                  textAlign: TextAlign.left,
                  obscureText: !_isPasswordVisible,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              // تذكرني وهل نسيت كلمة المرور
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // هل نسيت كلمة المرور
                  TextButton(
                    onPressed: () {
                      // اكشن نسيان كلمة المرور
                    },
                    child: const Text(
                      'هل نسيت كلمة المرور؟',
                      style: TextStyle(
                        color: Color(0xFFFFB800),
                        fontFamily: 'Cairo',
                        fontSize: 14,
                      ),
                    ),
                  ),
                  // تذكرني
                  Row(
                    children: [
                      const Text(
                        'تذكرني',
                        style: TextStyle(
                          color: Color(0xFFFFB800),
                          fontFamily: 'Cairo',
                          fontSize: 14,
                        ),
                      ),
                      Checkbox(
                        value: _isPasswordVisible,
                        onChanged: (value) {
                          setState(() {
                            _isPasswordVisible = value ?? false;
                          });
                        },
                        activeColor: const Color(0xFFFFB800),
                        checkColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // زر تسجيل الدخول
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (phoneNumber == null || phoneNumber!.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('برجاء إدخال رقم الجوال'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OTPScreen(phoneNumber: phoneNumber!),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB800),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
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

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
