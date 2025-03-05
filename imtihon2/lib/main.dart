import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BirinchiSahifa(),
    );
  }
}

class BirinchiSahifa extends StatefulWidget {
  const BirinchiSahifa({Key? key}) : super(key: key);

  @override
  _BirinchiSahifaState createState() => _BirinchiSahifaState();
}

class _BirinchiSahifaState extends State<BirinchiSahifa> {
  TextEditingController familiyaController = TextEditingController();
  TextEditingController ismController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController parolController = TextEditingController();

  bool showErrors = false;

  void _onSaqlashPressed() {
    setState(() {
      showErrors = true;
    });

    if (familiyaController.text.isEmpty ||
        ismController.text.isEmpty ||
        loginController.text.isEmpty ||
        parolController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Iltimos, barcha maydonlarni to'ldiring!"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Ma'lumotlar muvaffaqiyatli saqlandi!"),
        ),
      );
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IkkinchiSahifa(
              login: loginController.text,
              parol: parolController.text,
            ),
          ),
        );
      });
    }
  }

  InputDecoration _buildDecoration({
    required String labelText,
    required bool isEmpty,
  }) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(
        color: showErrors && isEmpty ? Colors.red : Colors.white70,
      ),
      errorText: showErrors && isEmpty ? "Hatoliklar" : null,
      filled: true,
      fillColor: Colors.white.withOpacity(0.2),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(
          color: showErrors && isEmpty ? Colors.red : Colors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(
          color: showErrors && isEmpty ? Colors.red : Colors.white,
          width: 2,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ro'yxatdan o'tish"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(color: Colors.deepPurple),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: familiyaController,
                    style: const TextStyle(color: Colors.black),
                    decoration: _buildDecoration(
                      labelText: "Familiya kiriting",
                      isEmpty: familiyaController.text.isEmpty,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: ismController,
                    style: const TextStyle(color: Colors.black),
                    decoration: _buildDecoration(
                      labelText: "Ism kiriting",
                      isEmpty: ismController.text.isEmpty,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: loginController,
                    style: const TextStyle(color: Colors.black),
                    decoration: _buildDecoration(
                      labelText: "Login kiriting",
                      isEmpty: loginController.text.isEmpty,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: parolController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.black),
                    decoration: _buildDecoration(
                      labelText: "Parol kiriting",
                      isEmpty: parolController.text.isEmpty,
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: _onSaqlashPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 18,
                      ),
                    ),
                    child: const Text(
                      "Saqlash",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IkkinchiSahifa extends StatefulWidget {
  final String login;
  final String parol;

  const IkkinchiSahifa({Key? key, required this.login, required this.parol})
      : super(key: key);

  @override
  State<IkkinchiSahifa> createState() => _IkkinchiSahifaState();
}

class _IkkinchiSahifaState extends State<IkkinchiSahifa> {
  TextEditingController login2Controller = TextEditingController();
  TextEditingController parol2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.purple],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: login2Controller,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      labelText: "Login kiriting",
                      labelStyle: TextStyle(color: Colors.black54),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: parol2Controller,
                    obscureText: true,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      labelText: "Parol kiriting",
                      labelStyle: TextStyle(color: Colors.black54),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (login2Controller.text == widget.login &&
                        parol2Controller.text == widget.parol) {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UchinchiSahifa(),
                          ),
                        );
                      });
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    "Kirish",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UchinchiSahifa extends StatefulWidget {
  const UchinchiSahifa({Key? key}) : super(key: key);

  @override
  State<UchinchiSahifa> createState() => _UchinchiSahifaState();
}

class _UchinchiSahifaState extends State<UchinchiSahifa> {
  String _currentTime = "";
  List nom = [];

  @override
  void initState() {
    super.initState();
    _updateTime();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateTime());
    api();
  }

  void _updateTime() {
    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    final second = now.second.toString().padLeft(2, '0');
    setState(() {
      _currentTime = "$hour:$minute:$second";
    });
  }

  Future<void> api() async {
    try {
      final url = Uri.parse("https://cbu.uz/uz/arkhiv-kursov-valyut/json/");
      final res = await http.get(url);

      if (res.statusCode == 200) {
        final List jsonnom = json.decode(res.body);
        setState(() {
          nom = jsonnom;
        });
      } else {
        debugPrint("Server xatosi: ${res.statusCode}");
      }
    } catch (e) {
      debugPrint("Xatolik: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Valyuta kurslari"),
            Row(
              children: [
                Text(_currentTime),
                IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BirinchiSahifa(),
                      ),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.exit_to_app, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: nom.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: nom.length,
              itemBuilder: (context, index) {
                final item = nom[index];
                final date = item['Date'] ?? "";
                final ccy = item['Ccy'] ?? "";
                final ccyNm = item['CcyNm_UZ'] ?? "";
                final code = item['Code'] ?? "";
                final rate = item['Rate'] ?? "";
                final diff = item['Diff'] ?? "";

                final isPositive = !diff.toString().startsWith('-');
                final diffColor = isPositive ? Colors.green : Colors.red;

                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("USD ma'lumotlari"),
                        content: Column(
                          children: [
                            Text("1 $ccy ($ccyNm) kursi: $rate\nFarq: $diff"),
                            TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Hisoblash"),
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("AQSH dollor"),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("qaytish"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Yangilangan kun $date",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "1 $ccy",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "$ccyNm ($code)",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  rate.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  diff.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: diffColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
