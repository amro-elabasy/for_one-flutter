import 'package:flutter/material.dart';
import '../barbers/barbers_screen.dart';
import '../../models/service_model.dart';
import '../../models/package_model.dart';
import '../../models/offer_model.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int selectedServiceIndex = -1;

  final List<ServiceModel> services = [
    ServiceModel(
      name: 'حلاقة الشعر',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/hair_cut.png',
      price: 160,
    ),
    ServiceModel(
      name: 'حلاقة الذقن',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/beard.png',
      price: 160,
    ),
    ServiceModel(
      name: 'تنظيف البشرة',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/face_clean.png',
      price: 160,
    ),
    ServiceModel(
      name: 'صبغة شعر',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/hair_dye.png',
      price: 160,
    ),
    ServiceModel(
      name: 'شمع للأذن والأنف',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/ear_clean.png',
      price: 160,
    ),
  ];

  final List<PackageModel> packages = [
    PackageModel(
      name: 'باقة الخليج',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/package1.png',
      price: 160,
    ),
    PackageModel(
      name: 'باقة الأسطورة',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/package2.png',
      price: 160,
    ),
    PackageModel(
      name: 'باقة القائد',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/package3.png',
      price: 160,
    ),
    PackageModel(
      name: 'باقة البطل',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/package4.png',
      price: 160,
    ),
    PackageModel(
      name: 'باقة المعلم',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/package5.png',
      price: 160,
    ),
  ];

  final List<OfferModel> offers = [
    OfferModel(
      name: 'عرض CR7',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/offer1.png',
      price: 160,
    ),
    OfferModel(
      name: 'عرض العيلة',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/offer1.png',
      price: 160,
    ),
    OfferModel(
      name: 'عرض الصحاب',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/offer1.png',
      price: 160,
    ),
    OfferModel(
      name: 'عرض الفخامة',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/offer1.png',
      price: 160,
    ),
    OfferModel(
      name: 'عرض القمة',
      description: 'حلاقة متقدمة مع شامبو شعري واستشارة حول منتجات العناية',
      icon: 'assets/icons/offer1.png',
      price: 160,
    ),
  ];

  bool showServices = false;
  bool showPackages = true;
  bool showOffers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'الخدمات',
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
      body: Column(
        children: [
          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showServices = false;
                      showPackages = false;
                      showOffers = true;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color:
                          showOffers ? const Color(0xFFFFB800) : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFFFB800)),
                    ),
                    child: Text(
                      'عروض',
                      style: TextStyle(
                        color:
                            showOffers ? Colors.black : const Color(0xFFFFB800),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showServices = false;
                      showPackages = true;
                      showOffers = false;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color:
                          showPackages ? const Color(0xFFFFB800) : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFFFB800)),
                    ),
                    child: Text(
                      'باقات',
                      style: TextStyle(
                        color: showPackages
                            ? Colors.black
                            : const Color(0xFFFFB800),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showServices = true;
                      showPackages = false;
                      showOffers = false;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color:
                          showServices ? const Color(0xFFFFB800) : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFFFB800)),
                    ),
                    child: Text(
                      'خدمات',
                      style: TextStyle(
                        color: showServices
                            ? Colors.black
                            : const Color(0xFFFFB800),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Services List
          Expanded(
            child: showServices
                ? ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: services[index].isSelected,
                              onChanged: (value) {
                                setState(() {
                                  services[index].isSelected = value!;
                                });
                              },
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            services[index].name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            services[index].description,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '${services[index].price} ر.س',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFB800),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.asset(
                                        services[index].icon,
                                        width: 37,
                                        height: 37,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : showPackages
                    ? ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: packages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: packages[index].isSelected,
                                  onChanged: (value) {
                                    setState(() {
                                      for (var package in packages) {
                                        package.isSelected = false;
                                      }
                                      packages[index].isSelected = value!;
                                      selectedServiceIndex = index;
                                      debugPrint(
                                          'Selected package index: $selectedServiceIndex');
                                    });
                                  },
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                packages[index].name,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                packages[index].description,
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          '${packages[index].price} ر.س',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFB800),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Image.asset(
                                            packages[index].icon,
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: offers.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: offers[index].isSelected,
                                  onChanged: (value) {
                                    setState(() {
                                      offers[index].isSelected = value!;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                offers[index].name,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                offers[index].description,
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          '${offers[index].price} ر.س',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFB800),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Image.asset(
                                            'assets/icons/offer1.png',
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
          ),
          // Next Button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                // تحقق من وجود خدمة مختارة
                bool hasSelectedService = false;
                String selectedName = '';
                double selectedPrice = 0;

                if (showServices) {
                  hasSelectedService =
                      services.any((service) => service.isSelected);
                  if (hasSelectedService) {
                    final service =
                        services.firstWhere((service) => service.isSelected);
                    selectedName = service.name;
                    selectedPrice = service.price;
                  }
                } else if (showPackages) {
                  hasSelectedService =
                      packages.any((package) => package.isSelected);
                  if (hasSelectedService) {
                    final package =
                        packages.firstWhere((package) => package.isSelected);
                    selectedName = package.name;
                    selectedPrice = package.price;
                  }
                } else if (showOffers) {
                  hasSelectedService = offers.any((offer) => offer.isSelected);
                  if (hasSelectedService) {
                    final offer =
                        offers.firstWhere((offer) => offer.isSelected);
                    selectedName = offer.name;
                    selectedPrice = offer.price;
                  }
                }

                if (!hasSelectedService) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('برجاء اختيار خدمة'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                // انتقل لصفحة الحلاقين
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BarbersScreen(
                      serviceName: selectedName,
                      servicePrice: selectedPrice,
                    ),
                  ),
                );
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
