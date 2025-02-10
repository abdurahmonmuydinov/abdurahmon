import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: MyWidget()),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String user = "a";
  String parol = "2";
  String hatolik = "";
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  void f() {
    setState(() {
      if (input1.text == "a" && input2.text == "1") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => salom()));
      } else {
        final nom = SnackBar(
          content: Text(hatolik = "usernemi yoki: parol xato"),
        );
        ScaffoldMessenger.of(context).showSnackBar(nom);
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: input1,
              decoration: InputDecoration(
                  label: Text("user"), border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: input2,
              decoration: InputDecoration(
                  label: Text("Paswort"), border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: () {
                    f();
                  },
                  child: Text("next"),
                )),
          ),
        ],
      ),
    );
  }
}

class salom extends StatefulWidget {
  const salom({super.key});

  @override
  State<salom> createState() => _salomState();
}

class _salomState extends State<salom> {
  String rasm = "rasm/a.jpg";
  String b = "";
  String text = "";
  void funksiya() {
    setState(() {
      if (b == "a") {
        rasm = "rasm/i.jpg";
        text = "instagiram";
      } else if (b == "d") {
        rasm = "rasm/a.jpg";
        text = "akchiya";
      }
      if (b == "g") {
        rasm = "rasm/b.jpg";
        text = "burger";
      } else if (b == "l") {
        rasm = "rasm/bb.jpg";
        text = "brrgerr";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("2 - Sahifa"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(rasm), fit: BoxFit.cover)),
                width: double.infinity,
                height: 600,
                child: Center(child: Text(text)),
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        b = "a";
                        funksiya();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("rasm/i.jpg"),
                                fit: BoxFit.cover)),
                        height: double.infinity,
                        width: 300,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        b = "d";
                        funksiya();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("rasm/a.jpg"),
                                fit: BoxFit.cover)),
                        height: double.infinity,
                        width: 300,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        b = "g";
                        funksiya();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("rasm/b.jpg"),
                                fit: BoxFit.cover)),
                        height: double.infinity,
                        width: 300,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        b = "l";
                        funksiya();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("rasm/bb.jpg"),
                                fit: BoxFit.cover)),
                        height: double.infinity,
                        width: 300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
