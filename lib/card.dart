import 'package:flutter/material.dart';


class MyCard extends StatefulWidget{
  const MyCard({super.key});
  @override
  _MyCardState createState() => _MyCardState();
}



class _MyCardState extends State<MyCard> {

  double x = 0;
  double y = 0;
  double z = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(
        child: Transform(
          transform: Matrix4(
            1,0,0,0,
            0,1,0,0,
            0,0,1,0,
            0,0,0,1,
          )..rotateX(x)..rotateY(y)..rotateZ(z),
          alignment: FractionalOffset.center,
          child: GestureDetector(
            onPanUpdate:(details){
              setState((){
                y = y - details.delta.dx / 100;
                x = x - details.delta.dy / 100;
              });
            },
            child: Container(
              color: Colors.blueGrey,
              height: 500.0,
              width: 250.0,
            ),
          ),
        ),
      ),
    );
  }
}