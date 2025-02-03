import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/Task.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final int taskCount;
  final IconData icon;

  const CategoryCard({
    required this.title,
    required this.taskCount,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskListPage(categoryTitle: title, uid: 'uid', categoryId: 'categoryId',),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 32, color: Colors.blue),
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '$taskCount tasks',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}