import 'package:flutter/material.dart';

class SearchFindDoctorWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final VoidCallback? onClear;

  const SearchFindDoctorWidget({
    super.key,
    required this.controller,
    this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: TextField(
        controller: controller,

        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Search Doctor...",
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon:
              controller.text.isNotEmpty
                  ? IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: onClear,
                  )
                  : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}
