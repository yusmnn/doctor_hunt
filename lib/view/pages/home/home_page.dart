import 'package:flutter/material.dart';

import '../../../utils/my_colors.dart';
import '../../widgets/category_icon_widget.dart';
import '../../widgets/feature_doctor_card.dart';
import '../../widgets/live_doctor_card.dart';
import '../../widgets/popular_doctor_card.dart';
import '../../widgets/search_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> liveDoctorImages = [
    'assets/images/doctor1.png',
    'assets/images/doctor2.png',
    'assets/images/doctor3.png',
  ];

  final List<Map<String, dynamic>> categories = [
    {'icon': 'icon1', 'color': Colors.blue},
    {'icon': 'icon2', 'color': Colors.green},
    {'icon': 'icon3', 'color': Colors.orange},
    {'icon': 'icon4', 'color': Colors.red},
  ];

  final List<Map<String, dynamic>> popularDoctors = [
    {
      'name': 'Dr. Fillerup Grab',
      'specialist': 'Medicine Specialist',
      'image': 'assets/images/profil1.png',
      'rating': 4.8,
    },
    {
      'name': 'Dr. Blessing',
      'specialist': 'Dentist Specialist',
      'image': 'assets/images/profil2.png',
      'rating': 4.7,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF00C6A9), Color(0xFF00E89E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.only(
                top: 60,
                left: 20,
                right: 20,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Hi Yusmnn",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(
                          'assets/images/profil1.png',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Find Your Doctor",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SearchBarWidget(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Live Doctors",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: liveDoctorImages.length,
                itemBuilder: (context, index) {
                  return LiveDoctorCard(imagePath: liveDoctorImages[index]);
                },
              ),
            ),

            const SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    categories
                        .map(
                          (cat) => CategoryIconWidget(
                            icon: cat['icon'],
                            color: cat['color'],
                          ),
                        )
                        .toList(),
              ),
            ),

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Popular Doctor",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("See all >", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  PopularDoctorCard(
                    name: "Dr. Crick",
                    imagePath: "assets/images/popular.png",
                    rating: 3.7,
                    specialist: 'Medicine Specialist',
                  ),
                  PopularDoctorCard(
                    name: "Dr. Strain",
                    imagePath: "assets/images/popular.png",
                    rating: 3.0,
                    specialist: 'Dentist Specialist',
                  ),
                  PopularDoctorCard(
                    name: "Dr. Strain",
                    imagePath: "assets/images/popular.png",
                    rating: 3.0,
                    specialist: 'Dentist Specialist',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Feature Doctor",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("See all >", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  FeatureDoctorCard(
                    name: "Dr. Crick",
                    imagePath: "assets/images/profil1.png",
                    rating: 3.7,
                    pricePerHour: "25.00",
                    isFavorite: false,
                  ),
                  FeatureDoctorCard(
                    name: "Dr. Strain",
                    imagePath: "assets/images/profil2.png",
                    rating: 3.0,
                    pricePerHour: "22.00",
                    isFavorite: true,
                  ),
                  FeatureDoctorCard(
                    name: "Dr. Lachinet",
                    imagePath: "assets/images/profil3.png",
                    rating: 2.9,
                    pricePerHour: "20.00",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
