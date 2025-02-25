import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuranScreen(),
  ));
}

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List data = [];

  void fetchQuranData() async {
    final response = await http.get(
        Uri.parse("https://api.alquran.cloud/v1/quran/quran-simple"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      setState(() {
        data = jsonData["data"]["surahs"];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchQuranData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Qur'on Suralari")),
      body: data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]["englishName"]),
                  subtitle: Text(
                      "Surah ${data[index]["number"]} - ${data[index]["englishNameTranslation"]}"),
                );
              },
            ),
    );
  }
}