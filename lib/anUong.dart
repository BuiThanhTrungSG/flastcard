import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class anUong extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return anUong_state();
  }
}

class anUong_state extends State<anUong>{

  // List<String> danhSach = ['ca','ga','cho','meo','lon','trau'];
  List<String> danhSach = ['bánh','kẹo','bát','cốc','nĩa','nồi','thìa','đĩa','đũa','bếp','chảo','ấm'];
  int selectedIndex = 0;
  PageController _controller = PageController(initialPage: 0, keepPage: false);
  bool statusGiongBac = false;
  bool statusTatAm = false;
  int posisonChu = 0;
  String tenfile = ' ';

  @override
  Widget build(BuildContext context) {

    double chieuRongManHinh = MediaQuery.of(context).size.width;
    double chieuCaoThanhTruot = chieuRongManHinh / 8;
    Color mauNen = Color(0xffffaecf);

    if (tenfile == ' '){
      tenfile = danhSach[0];
    }

    return Scaffold(
      body: SafeArea(
          child: Container(
            color: mauNen,
            child: Column (
              children: [
                Container(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            Navigator.pushNamed(context, "/");
                          },
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),
                      Expanded(
                        child: Container(
                        ),
                      ),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              statusGiongBac = !statusGiongBac;
                              PhatAmThanh();
                            });
                          },
                          child: Text("Giọng Bắc",style: TextStyle(color: Colors.red, fontSize: 14))),
                      Switch(
                        // This bool value toggles the switch.
                        value: statusGiongBac,
                        activeColor: Colors.red,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            statusGiongBac = value;
                            PhatAmThanh();
                          });
                        },
                      ),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              statusTatAm = !statusTatAm;
                            });
                          },
                          child: Text("Tắt âm thanh",style: TextStyle(color: Colors.red, fontSize: 14))),
                      Switch(
                        // This bool value toggles the switch.
                        value: statusTatAm,
                        activeColor: Colors.red,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            statusTatAm = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      child: PageView.builder(
                          controller: _controller,
                          itemCount: danhSach.length,
                          itemBuilder: (context, indext) {
                            posisonChu = indext;
                            tenfile = danhSach[indext];
                            return GestureDetector(
                              onTap: (){
                                tenfile = danhSach[indext];
                                PhatAmThanh();
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.pinkAccent, width: 8),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0) //                 <--- border radius here
                                    ),
                                  ),
                                  child: Image.asset('assets/image/card/$tenfile.png')
                              ),
                            );
                          })),
                ),
                Container(
                  width: chieuRongManHinh,
                  height: chieuCaoThanhTruot,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: danhSach.length,
                      itemBuilder: (context, position) {
                        return GestureDetector(
                          onTap: () {
                            tenfile = danhSach[position];
                            PhatAmThanh();
                            setState(() {
                              posisonChu = position;
                              selectedIndex = position;
                              _controller.jumpToPage(selectedIndex);
                            });
                          },
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            height: chieuCaoThanhTruot,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                            // width: chieuCaoThanhTruot,
                            margin: EdgeInsets.all(1),
                            color: selectedIndex == position
                                ? Colors.pinkAccent
                                : Color(0x81ffffff),
                            child: Text(
                              danhSach[position].toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20,
                                  // fontFamily: 'arial',
                                  color: selectedIndex == position
                                      ? Colors.white
                                      : Colors.red),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          )

      ),
    );
  }

  void PhatAmThanh() {
    if (!statusTatAm){
      final player = AudioPlayer();
      if (statusGiongBac){
        player.play(AssetSource('audio/card/giongBac/$tenfile.m4a'));
      }else{
        player.play(AssetSource('audio/card/giongNam/$tenfile.mp3'));
      }
    }
  }

}