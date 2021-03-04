import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Image image;
  final String name;

  CategoryCard(this.image, this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey[400])]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              image,
              SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff6e475b),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
