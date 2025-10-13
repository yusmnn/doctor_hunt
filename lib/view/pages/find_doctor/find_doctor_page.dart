import 'package:doctor_hunt/utils/my_colors.dart';
import 'package:doctor_hunt/view/pages/select_time/select_time_page.dart';
import 'package:doctor_hunt/view/widgets/find_doctor_card.dart';
import 'package:doctor_hunt/view/widgets/search_find_doctor_widget.dart';
import 'package:flutter/material.dart';

class FindDoctorPage extends StatefulWidget {
  const FindDoctorPage({super.key});

  static const String routeName = '/find_doctor_page';

  @override
  State<FindDoctorPage> createState() => _FindDoctorPageState();
}

class _FindDoctorPageState extends State<FindDoctorPage> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr. Shruti Kedia",
      "specialty": "Tooths Dentist",
      "experience": "7 Years experience",
      "availability": "10:00 AM tomorrow",
      "imageUrl": "https://randomuser.me/api/portraits/women/44.jpg",
      "rating": 0.67,
      "storiesCount": 69,
      "isFavorite": true,
    },
    {
      "name": "Dr. Watamaniuk",
      "specialty": "Tooths Dentist",
      "experience": "9 Years experience",
      "availability": "12:00 AM tomorrow",
      "imageUrl": "https://randomuser.me/api/portraits/men/32.jpg",
      "rating": 0.74,
      "storiesCount": 78,
      "isFavorite": false,
    },
    {
      "name": "Dr. Crownnover",
      "specialty": "Tooths Dentist",
      "experience": "5 Years experience",
      "availability": "11:00 AM tomorrow",
      "imageUrl": "https://randomuser.me/api/portraits/men/56.jpg",
      "rating": 0.59,
      "storiesCount": 86,
      "isFavorite": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: textColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 24),
                const Text(
                  "Find Doctor",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            SearchFindDoctorWidget(
              controller: _searchController,
              onChanged: (value) {
                setState(() {});
              },
              onClear: () {
                _searchController.clear();
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            ListView.builder(
              itemCount: doctors.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return FindDoctorCard(
                  name: doctor["name"],
                  specialty: doctor["specialty"],
                  experience: doctor["experience"],
                  availability: doctor["availability"],
                  time: doctor["availability"],
                  imageUrl: doctor["imageUrl"],
                  rating: doctor["rating"],
                  storiesCount: doctor["storiesCount"],
                  isFavorite: doctor["isFavorite"],
                  onBookNow: () {
                    Navigator.pushNamed(context, SelectTimePage.routeName);
                  },
                  onFavoriteToggle: () {
                    setState(() {
                      doctor["isFavorite"] = !doctor["isFavorite"];
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
