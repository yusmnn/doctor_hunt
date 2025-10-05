import 'package:flutter/material.dart';

class PopularDoctorCard extends StatelessWidget {
  final String name;
  final String specialist;
  final String imagePath;
  final double rating;

  const PopularDoctorCard({
    super.key,
    required this.name,
    required this.specialist,
    required this.imagePath,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              imagePath,
              height: 140,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            specialist,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                size: 16,
                color:
                    index < rating.round()
                        ? Colors.amber
                        : Colors.grey.shade300,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
