import 'package:flutter/material.dart';

class MoodCard extends StatelessWidget {
  final String mood;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;

  MoodCard({
    required this.mood,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isSelected ? Colors.blue : Colors.white,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40),
              SizedBox(width: 10),
              Text(
                mood,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
