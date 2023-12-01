import 'package:flashcards/dongVatTuNhien.dart';
import 'package:flashcards/dongVatXungQuanh.dart';
import 'package:flutter/material.dart';

import 'chuCai.dart';
import 'chuSo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/chuCai": (context) => chuCai(),
        "/chuSo": (context) => chuSo(),
        "/dongVatXungQuanh": (context) => dongVatXungQuanh(),
        "/dongVatTuNhien": (context) => dongVatTuNhien(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    final kieuChu = TextStyle(fontSize: 13, color: Colors.pink);
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Wrap(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                children: [
                  IconButton(
                    icon: Image.asset('assets/icon/iconSo.png'),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.pushNamed(context, "/chuSo");
                    },
                  ),
                  Text("Chữ số", style: kieuChu),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                children: [
                  IconButton(
                    icon: Image.asset('assets/icon/iconChu.png'),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.pushNamed(context, "/chuCai");
                    },
                  ),
                  Text("Chữ cái", style: kieuChu),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                children: [
                  IconButton(
                    icon: Image.asset('assets/icon/iconDongVatXungQuanh.png'),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.pushNamed(context, "/dongVatXungQuanh");
                    },
                  ),
                  Text("Động vật xung quanh", style: kieuChu),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                children: [
                  IconButton(
                    icon: Image.asset('assets/icon/iconDongVatTuNhien.png'),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.pushNamed(context, "/dongVatXungQuanh");
                    },
                  ),
                  Text("Động vật tự nhiên", style: kieuChu),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
