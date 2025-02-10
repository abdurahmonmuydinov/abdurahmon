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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("rasm/i.jpg"), fit: BoxFit.cover)),
            width: double.infinity,
            height: 600,
          ),
        ),
        Container(
          width: double.infinity,
          height: 200,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("rasm/i.jpg"), fit: BoxFit.cover)),
                  height: double.infinity,
                  width: 300,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("rasm/a.jpg"), fit: BoxFit.cover)),
                  height: double.infinity,
                  width: 300,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("rasm/b.jpg"), fit: BoxFit.cover)),
                  height: double.infinity,
                  width: 300,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
