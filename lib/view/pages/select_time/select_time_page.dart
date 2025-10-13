import 'package:doctor_hunt/utils/my_colors.dart';
import 'package:flutter/material.dart';

class SelectTimePage extends StatefulWidget {
  const SelectTimePage({super.key});

  static const String routeName = '/select_time_page';

  @override
  State<SelectTimePage> createState() => _SelectTimePageState();
}

class _SelectTimePageState extends State<SelectTimePage> {
  int selectedIndex = 1; // default selected date index

  final List<Map<String, dynamic>> dates = [
    {"day": "Today", "date": "23 Feb", "slots": 0},
    {"day": "Tomorrow", "date": "24 Feb", "slots": 9},
    {"day": "Thu", "date": "25 Feb", "slots": 5},
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
                  "Select Time",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/doctor1.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Dr. Shruti Kedia",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            "Upasana Dental Clinic, Salt Lake",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 Date Selector
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SizedBox(
                height: 54,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  itemBuilder: (context, index) {
                    final date = dates[index];
                    final isSelected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () => setState(() => selectedIndex = index),
                      child: Container(
                        width: 140,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? primaryColor : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:
                                isSelected
                                    ? Colors.transparent
                                    : Colors.grey.shade300,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${date["day"]}, ${date["date"]}",
                              style: TextStyle(
                                color: isSelected ? Colors.white : textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${date["slots"]} slots available",
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected ? Colors.white : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 32),

            // 🔹 Selected Date
            Center(
              child: Text(
                "${dates[selectedIndex]["day"]}, ${dates[selectedIndex]["date"]}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: textColor,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // 🔹 No slots
            const Center(
              child: Text(
                "No slots available",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),

            const SizedBox(height: 32),

            // 🔹 Next availability button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Next availability on Wed, 24 Feb",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 OR text
            const Center(
              child: Text(
                "OR",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 Contact Clinic button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.green),
                  minimumSize: const Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Contact Clinic",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
