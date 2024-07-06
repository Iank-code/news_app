import 'package:flutter/material.dart';

class ViewNews extends StatelessWidget {
  final Map<String, dynamic> newsItem;

  const ViewNews({Key? key, required this.newsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          newsItem['author'] ?? 'News Details',
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsItem['title'] ?? 'No Title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Image.network(newsItem['urlToImage'] ?? ''),
            SizedBox(height: 10),
            Text(
              newsItem['description'] ?? 'No Description',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
