import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chuCai extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return chuCai_state();
  }
}

class chuCai_state extends State<chuCai> {

  List<String> danhSachChu = ['a','ă','â','b','c','d','đ','e','ê','g','h','i','k','l','m','n','o','ô','ơ','p','q','r','s','t','u','ư','v','x','y'];
  List<String> danhSachFile = ['a','aw','aa','b','c','d','dd','e','ee','g','h','i','k','l','m','n','o','oo','ow','p','q','r','s','t','u','uw','v','x','y'];
  int selectedIndex = 0;
  PageController _controller = PageController(initialPage: 0, keepPage: false);
  bool statusChuInHoa = false;
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
      tenfile = danhSachFile[0];
    }

    return Scaffold(
      body: SafeArea (
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
                        onTap: () {
                          setState(() {
                            statusChuInHoa = !statusChuInHoa;
                          });
                        },
                        child: Text("Chữ Hoa", style: TextStyle(fontSize: 12, color: Colors.red),
                        )
                    ),
                    Switch(
                      // This bool value toggles the switch.
                      value: statusChuInHoa,
                      activeColor: Colors.red,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          statusChuInHoa = value;
                        });
                      },
                    ),
                    GestureDetector(
                        onTap: (){
                          setState(() {
                            statusGiongBac = !statusGiongBac;
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
                          tenfile = danhSachFile[posisonChu];
                          PhatAmThanh();
                        });
                      },
                    ),
                    GestureDetector(
                        onTap: (){
                          setState(() {
                            statusTatAm = !statusTatAm;
                            tenfile = danhSachFile[posisonChu];
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
                          tenfile = danhSachFile[posisonChu];
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
                              tenfile = danhSachFile[indext];
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
                              child: Text(
                                statusChuInHoa ? danhSachChu[indext].toUpperCase() : danhSachChu[indext].toLowerCase(),
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
                          tenfile = danhSachFile[position];
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
                            statusChuInHoa ? danhSachChu[position].toUpperCase() : danhSachChu[position].toLowerCase(),
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
        player.play(AssetSource('audio/card/giongBac/$tenfile.m4a'));
      }else{
        player.play(AssetSource('audio/card/giongNam/$tenfile.mp3'));
      }
    }
  }

}
