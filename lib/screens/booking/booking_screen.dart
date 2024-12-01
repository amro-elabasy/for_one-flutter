import 'package:flutter/material.dart';
import 'booking_confirmation_screen.dart';

class BookingScreen extends StatefulWidget {
  final String serviceName;
  final String barberName;
  final double servicePrice;
  final String barberImage;

  const BookingScreen({
    super.key,
    required this.serviceName,
    required this.barberName,
    required this.servicePrice,
    required this.barberImage,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime selectedDate = DateTime.now();
  int currentMonth = 12;
  int currentYear = 2024;
  List<String> months = [
    'يناير',
    'فبراير',
    'مارس',
    'إبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر'
  ];

  // قائمة الأيام المحجوزة
  List<int> bookedDays = [15, 22, 29];

  // نعرف المتغيرات في أول الكلاس
  int hours = 1; // القيمة الابتدائية 1
  int minutes = 0; // القيمة الابتدائية 0
  bool isAM = true; // نضيف متغير للوقت صباحاً/مساءً

  void nextMonth() {
    setState(() {
      if (currentMonth == 12) {
        currentMonth = 1;
        currentYear++;
      } else {
        currentMonth++;
      }
      selectedDate = DateTime(currentYear, currentMonth, 1);
    });
  }

  void previousMonth() {
    setState(() {
      if (currentMonth == 1) {
        currentMonth = 12;
        currentYear--;
      } else {
        currentMonth--;
      }
      selectedDate = DateTime(currentYear, currentMonth, 1);
    });
  }

  void _handleNextButton() {
    if (!mounted) return;

    String period = isAM ? 'صباحاً' : 'مساءً';
    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} $period';

    print("Navigating with data:");
    print("Service Name: ${widget.serviceName}");
    print("Service Price: ${widget.servicePrice}");
    print("Barber Name: ${widget.barberName}");
    print("Booking Date: $selectedDate");
    print("Booking Time: $formattedTime");
    print("Image URL: ${widget.barberImage}");

    var confirmationScreen = BookingConfirmationScreen(
      serviceName: widget.serviceName,
      servicePrice: widget.servicePrice,
      barberName: widget.barberName,
      bookingDate: selectedDate,
      bookingTime: formattedTime,
      imageUrl: widget.barberImage,
    );

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => confirmationScreen,
      ),
      (route) => route.isFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'موعد الحجز',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // عنوان الشهر والسنة
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  months[currentMonth - 1],
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  currentYear.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),

          // أزرار التنقل بين الشهور
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  onPressed: previousMonth,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    minimumSize: const Size(50, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  onPressed: nextMonth,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    minimumSize: const Size(50, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.black),
                ),
              ),
            ],
          ),

          // زر الشهر التالي
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: nextMonth,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'الشهر التالي',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // أيام الأسبوع
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                'السبت',
                'الجمعة',
                'الخميس',
                'الأربعاء',
                'الثلاثاء',
                'الاثنين',
                'الأحد',
              ]
                  .map((day) => Text(
                        day,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ))
                  .toList(),
            ),
          ),

          // التقويم
          Expanded(
            child: SingleChildScrollView(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: DateTime(currentYear, currentMonth + 1, 0).day,
                itemBuilder: (context, index) {
                  final day = index + 1;
                  final isBooked = bookedDays.contains(day);
                  final isSelected = day == selectedDate.day &&
                      currentMonth == selectedDate.month &&
                      currentYear == selectedDate.year;

                  return GestureDetector(
                    onTap: () {
                      if (!isBooked) {
                        setState(() {
                          selectedDate =
                              DateTime(currentYear, currentMonth, day);
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isBooked
                            ? Colors.red
                            : isSelected
                                ? Colors.amber
                                : Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          day.toString(),
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white,
                            fontSize: 16,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // اختيار الوقت
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // عنوان اختر الوقت
                const Text(
                  'اختر الوقت',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                ),

                const SizedBox(height: 15),

                // مواعيد العمل
                const Text(
                  'مواعيد العمل من 10:00 صباحا الى 2:00 صباحا ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                // Time Picker Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTimeSelector(
                      value: hours.toString().padLeft(2, '0'),
                      onIncrement: () {
                        setState(() {
                          if (hours < 12) {
                            hours++;
                          } else {
                            hours = 1;
                          }
                        });
                      },
                      onDecrement: () {
                        setState(() {
                          if (hours > 1) {
                            hours--;
                          } else {
                            hours = 12;
                          }
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        ':',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildTimeSelector(
                      value: minutes.toString().padLeft(2, '0'),
                      onIncrement: () {
                        setState(() {
                          if (minutes < 30) {
                            minutes = 30;
                          } else {
                            minutes = 0;
                          }
                        });
                      },
                      onDecrement: () {
                        setState(() {
                          if (minutes == 30) {
                            minutes = 0;
                          } else {
                            minutes = 30;
                          }
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAM = !isAM;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          isAM ? 'AM' : 'PM',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // زر التالي
                ElevatedButton(
                  onPressed: _handleNextButton,
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSelector({
    required String value,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Container(
      width: 70,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onDecrement,
            child: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
              size: 18,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          InkWell(
            onTap: onIncrement,
            child: const Icon(
              Icons.keyboard_arrow_up,
              color: Colors.black,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
