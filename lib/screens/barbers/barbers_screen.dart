import 'package:flutter/material.dart';
import '../booking/booking_screen.dart';

class BarbersScreen extends StatefulWidget {
  final String serviceName;
  final double servicePrice;

  const BarbersScreen({
    super.key,
    required this.serviceName,
    required this.servicePrice,
  });

  @override
  State<BarbersScreen> createState() => _BarbersScreenState();
}

class _BarbersScreenState extends State<BarbersScreen> {
  // قائمة فارغة للحلاقين
  List<Map<String, dynamic>> barbers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // استدعاء البيانات عند فتح الصفحة
    loadBarbers();
  }

  // دالة لتحميل بيانات الحلاقين
  Future<void> loadBarbers() async {
    // مؤقتاً: نضع بيانات تجريبية
    // لاحقاً: سيتم استبدالها بالبيانات من API
    await Future.delayed(const Duration(seconds: 1)); // محاكاة وقت التحميل
    setState(() {
      barbers = [
        {
          'id': '1',
          'name': 'حلاق 1',
          'imageUrl': '',
          'isSelected': false,
        },
        {
          'id': '2',
          'name': 'حلاق 2',
          'imageUrl': '',
          'isSelected': false,
        },
        {
          'id': '3',
          'name': 'حلاق 3',
          'imageUrl': '',
          'isSelected': false,
        },
        {
          'id': '4',
          'name': 'حلاق 4',
          'imageUrl': '',
          'isSelected': false,
        },
      ];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'اختر الحلاق',
          style: TextStyle(
            color: Color(0xFFFFB800),
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFFFB800),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: barbers.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            for (var barber in barbers) {
                              barber['isSelected'] = false;
                            }
                            barbers[index]['isSelected'] = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: barbers[index]['isSelected']
                                  ? const Color(0xFFFFB800)
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  barbers[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -55),
                  child: ElevatedButton(
                    onPressed: () {
                      bool hasSelected =
                          barbers.any((barber) => barber['isSelected']);
                      if (hasSelected) {
                        final selectedBarber = barbers
                            .firstWhere((barber) => barber['isSelected']);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingScreen(
                              serviceName: widget.serviceName,
                              servicePrice: widget.servicePrice,
                              barberName: selectedBarber['name'],
                              barberImage: selectedBarber['imageUrl'].isEmpty
                                  ? 'https://example.com/default-image.jpg'
                                  : selectedBarber['imageUrl'],
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('برجاء اختيار حلاق'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFB800),
                      minimumSize: const Size(200, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'التالي',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
