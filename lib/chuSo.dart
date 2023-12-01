import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chuSo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return chuSo_state();
  }

}

class chuSo_state extends State<chuSo>{

  List<String> danhSachChu = ['1','2','3','4','5','6','7','8','9','0'];
  int selectedIndex = 0;
  PageController _controller = PageController(initialPage: 0, keepPage: false);
  bool statusGiongBac = false;
  bool statusTatAm = false;
  int posisonChu = 0;
  String tenfile = ' ';
  Color mauNen = Color(0xffffaecf);

  @override
  Widget build(BuildContext context) {

    double chieuRongManHinh = MediaQuery.of(context).size.width;
    double chieuCaoThanhTruot = chieuRongManHinh / 7;
    if (tenfile == ' '){
      tenfile = danhSachChu[0];
    }

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Container(
                color: mauNen,
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
                            tenfile = danhSachChu[posisonChu];
                            PhatAmThanh();
                          });
                        },
                        child: Text("Giọng Bắc",style: TextStyle(fontSize: 12, color: Colors.red),
                        )),
                    Switch(
                      // This bool value toggles the switch.
                      value: statusGiongBac,
                      activeColor: Colors.red,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          statusGiongBac = value;
                          tenfile = danhSachChu[posisonChu];
                          PhatAmThanh();
                        });
                      },
                    ),
                    GestureDetector(
                        onTap: (){
                          setState(() {
                            statusTatAm = !statusTatAm;
                            tenfile = danhSachChu[posisonChu];
                            PhatAmThanh();
                          });
                        },
                        child: Text("Tắt âm thanh",style: TextStyle(fontSize: 12, color: Colors.red),
                        )),
                    Switch(
                      // This bool value toggles the switch.
                      value: statusTatAm,
                      activeColor: Colors.red,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          statusTatAm = value;
                          tenfile = danhSachChu[posisonChu];
                          PhatAmThanh();
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    color: mauNen,
                    child: PageView.builder(
                        controller: _controller,
                        itemCount: danhSachChu.length,
                        itemBuilder: (context, indext) {
                          posisonChu = indext;
                          return GestureDetector(
                            onTap: (){
                              tenfile = danhSachChu[indext];
                              PhatAmThanh();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.pinkAccent, width: 8),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20.0) //                 <--- border radius here
                                ),
                              ),
                              child: Text(
                                danhSachChu[indext],
                                style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontFamily: 'arial',
                                  fontSize: 350,
                                ),
                              ),
                            ),
                          );
                        })),
              ),
              Container(
                width: chieuRongManHinh,
                height: chieuCaoThanhTruot,
                color: mauNen,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: danhSachChu.length,
                    itemBuilder: (context, position) {
                      return GestureDetector(
                        onTap: () {
                          tenfile = danhSachChu[position];
                          PhatAmThanh();
                          setState(() {
                            posisonChu = position;
                            selectedIndex = position;
                            _controller.jumpToPage(selectedIndex);
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: chieuCaoThanhTruot,
                          width: chieuCaoThanhTruot,
                          margin: EdgeInsets.all(1),
                          color: selectedIndex == position
                              ? Colors.pinkAccent
                              : Color(0x81ffffff),

                          child: Text(
                            danhSachChu[position],
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'arial',
                                color: selectedIndex == position
                                    ? Colors.white
                                    : Colors.red),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          )),
    );
  }

  void PhatAmThanh() {
    if (!statusTatAm){
      final player = AudioPlayer();
      if (statusGiongBac){
        player.play(AssetSource('audio/chuSo/giongBac/$tenfile.mp3'));
      }else{
        player.play(AssetSource('audio/chuSo/giongNam/$tenfile.mp3'));
      }
    }
  }
}