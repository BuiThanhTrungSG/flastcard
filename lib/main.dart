import 'package:flashcards/anUong.dart';
import 'package:flashcards/dongVatTuNhien.dart';
import 'package:flashcards/dongVatXungQuanh.dart';
import 'package:flashcards/quanAo.dart';
import 'package:flutter/material.dart';

import 'chuCai.dart';
import 'chuSo.dart';
import 'doVat.dart';
import 'ngoaiTroi.dart';

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
        "/quanAo": (context) => quanAo(),
        "/anUong": (context) => anUong(),
        "/ngoaiTroi": (context) => ngoaiTroi(),
        "/doVat": (context) => doVat(),
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

    final khungAnh = BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.orange, width: 4),
        borderRadius: BorderRadius.all(Radius.circular(10.0)
        ));

    final TextStyle kieuChu = const TextStyle(fontSize: 13, color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold);
    final double iconSize = 180;
    final EdgeInsetsGeometry coAnh = EdgeInsets.fromLTRB(0, 15, 0, 15);

    double chieuRongManHinh = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xfffce8d2),
          width: chieuRongManHinh,
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(

                alignment: Alignment.topCenter,
                child: Image.asset('assets/lineTop.png', width: chieuRongManHinh,),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                      direction: Axis.horizontal,
                      // spacing: 5,
                      runSpacing: 12,
                      children: [
                        Container(
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
                          child: Column(
                            children: [
                              IconButton(
                                icon: Container(
                                    padding: coAnh,
                                    decoration: khungAnh,
                                    child: Image.asset('assets/image/dongVatXungQuanh/gà.png')
                                ),
                                iconSize: iconSize,
                                onPressed: () {
                                  Navigator.pushNamed(context, "/dongVatXungQuanh");
                                },
                              ),
                              Text("Động vật xung quanh", style: kieuChu),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                icon: Container(
                                    child: Container(
                                        padding: coAnh,
                                        decoration: khungAnh,
                                        child: Image.asset('assets/image/dongVatTuNhien/thỏ.png')
                                    )
                                ),
                                iconSize: iconSize,
                                onPressed: () {
                                  Navigator.pushNamed(context, "/dongVatTuNhien");
                                },
                              ),
                              Text("Động vật tự nhiên", style: kieuChu),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                icon: Container(
                                    padding: coAnh,
                                    decoration: khungAnh,
                                    child: Image.asset('assets/image/quanAo/áo.png')),
                                iconSize: iconSize,
                                onPressed: () {
                                  Navigator.pushNamed(context, "/quanAo");
                                },
                              ),
                              Text("Quần áo", style: kieuChu),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                icon: Container(
                                    padding: coAnh,
                                    decoration: khungAnh,
                                    child: Image.asset('assets/image/doVat/đèn.png')),
                                iconSize: iconSize,
                                onPressed: () {
                                  Navigator.pushNamed(context, "/doVat");
                                },
                              ),
                              Text("Đồ vật", style: kieuChu),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                icon: Container(
                                    padding: coAnh,
                                    decoration: khungAnh,
                                    child: Image.asset('assets/image/ngoaiTroi/cây.png')),
                                iconSize: iconSize,
                                onPressed: () {
                                  Navigator.pushNamed(context, "/ngoaiTroi");
                                },
                              ),
                              Text("Ngoài trời", style: kieuChu),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                icon: Container(
                                    padding: coAnh,
                                    decoration: khungAnh,
                                    child: Image.asset('assets/image/anUong/bánh.png')),
                                iconSize: iconSize,
                                onPressed: () {
                                  Navigator.pushNamed(context, "/anUong");
                                },
                              ),
                              Text("Ăn uống", style: kieuChu),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/lineBottom.png', width: chieuRongManHinh,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
