import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  // دالة لفتح الواتساب - ضع رقم الواتساب الصحيح
  Future<void> _launchWhatsApp() async {
    final Uri whatsappUrl = Uri.parse('https://wa.me/+966XXXXXXXXX');
    if (!await launcher.launchUrl(whatsappUrl)) {
      throw Exception('Could not launch WhatsApp');
    }
  }

  // دالة للاتصال - ضع رقم الهاتف الصحيح
  Future<void> _makePhoneCall() async {
    final Uri phoneUrl = Uri.parse('tel:+966XXXXXXXXX');
    if (!await launcher.launchUrl(phoneUrl)) {
      throw Exception('Could not make phone call');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        // أضفنا SingleChildScrollView
        child: Column(
          children: [
            // صورة الصالون
            Image.asset(
              'assets/images/salon_image.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            // اسم الصالون
            const Text(
              'صالون فور وان للحلاقة',
              style: TextStyle(
                color: Color(0xFFFFB800),
                fontSize: 24,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // العنوان
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xFFFFB800)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'طريق النهضه، بجوار الدانوب وموبايلي، الرياض',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // خريطة الموقع
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/images/map.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // أزرار الاتصال والواتساب
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _makePhoneCall,
                      icon: const Icon(Icons.phone, color: Colors.black),
                      label: const Text(
                        'اتصال',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFB800),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _launchWhatsApp,
                      icon: const FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'واتساب',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFB800),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // نص انتظروا الفروع
            const Text(
              'انتظروا المزيد من الفروع قريباً!!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Cairo',
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
