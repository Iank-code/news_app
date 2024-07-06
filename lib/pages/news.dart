import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/pages/view_news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Map<String, dynamic>> _newsData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const apiKey = '1ed800b856a147b4862625a31d48fd0a';
    const url = 'https://newsapi.org/v2/everything';

    final response = await http.get(Uri.parse('$url?q=flutter&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      // Request successful, parse the response data
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      setState(() {
        _newsData = (responseData['articles'] as List<dynamic>)
            .cast<Map<String, dynamic>>();
      });
    } else {
      // Request failed
      print('Failed to fetch data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('News Page'),
        actions: [
          IconButton(
            onPressed: () {
              // Implement notification action
            },
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              // Implement logout action
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: _newsData.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: _newsData.length,
                itemBuilder: (context, index) {
                  final newsItem = _newsData[index];
                  return ListTile(
                    title: Text(newsItem['title'] ?? ''),
                    subtitle: Text(newsItem['description'] ?? ''),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ViewNews(newsItem: newsItem)),
                      );
                    },
                  );
                },
              ),
            ),
    );
  }
}
