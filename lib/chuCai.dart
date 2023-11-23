import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chuCai extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return chuCai_state();
  }

}

class chuCai_state extends State<chuCai>{
  List<String> danhSachChu = ['A', 'ă', 'â', 'b', 'c', 'd', 'đ'];

  @override
  Widget build(BuildContext context) {
    double chieuRongManHinh = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: PageView.builder(
                    itemCount: danhSachChu.length,
                    itemBuilder: (context, indext){
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Text(danhSachChu[indext], style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 300,
                            ),
                            ),
                          ],
                        ),
                      );
                    }
                )
              ),
            ),
            Container(width: chieuRongManHinh, height: chieuRongManHinh/5, color: Colors.red,),
          ],
        )
    );
  }

}