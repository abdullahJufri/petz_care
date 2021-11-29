import 'package:flutter/material.dart';

class Card_menu extends StatelessWidget {
  const Card_menu({Key? key, required this.icon, required this.title})
      : super(key: key);
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
          ),
          Icon(
            icon,
            size: 100,
            color: Colors.blue,
          ),
          SizedBox(height: 3),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
