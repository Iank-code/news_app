import 'package:flutter/material.dart';
import 'package:news_app/pages/news.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildUI(context),
    );
  }
}

Widget _buildUI(BuildContext context) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_title(), _loginButton(context)],
    ),
  );
}

Widget _title() {
  return const Text(
    'News App',
    style: TextStyle(
        fontSize: 35, fontWeight: FontWeight.w300, color: Colors.white),
  );
}

Widget _loginButton(BuildContext context) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * 0.60,
    child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NewsPage()),
          );
        },
        child: const Text('View News')),
  );
}
