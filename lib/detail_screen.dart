import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const DetailScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrl),
            ),
            SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
