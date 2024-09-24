import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:carousel_slider/carousel_state.dart';

class Home extends StatefulWidget{
  const Home({super.key});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  void initState(){
    super.initState();
      CarouselControllerImpl _impl = CarouselControllerImpl();
      CarouselSliderState _state = CarouselSliderState(_impl);
      final _controller = PageController();
      int _currentPage = _controller.page!.floor();
  }
  
  double x = 0;
  double y = 0;
  double z = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(
        child: CarouselSlider(
          options:CarouselOptions(
            height: 600.0,
            viewportFraction: 0.75,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            ),
          items: [1,2,3,4,5].map((i) {
            if ( _currentPage > i-1){
              return Builder(
                builder: (BuildContext context){
                  return Container(
                  transform: Matrix4(
                    1,0,0,0,
                    0,1,0,0,
                    0,0,1,0,
                    0,0,0,1.5,
                  )..rotateX(x)..rotateY(y)..rotateZ(z),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey
                  ),
                  child: Center(child: Text('text $i', style: TextStyle(fontSize: 12.0),))
                  );
                },
              );
            } 
            else if (i+1 > i ){
              return Builder(
                builder: (BuildContext context){
                  return Container(
                  transform: Matrix4(
                    1,0,0,0,
                    0,1,0,0,
                    0,0,1,0,
                    0,0,0,2,
                  )..rotateX(x)..rotateY(y)..rotateZ(z),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey
                  ),
                  child: Center(child: Text('text $i', style: TextStyle(fontSize: 12.0),))
                  );
                },
              );
            } 
            else {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey
                  ),
                  child: Center(child: Text('text $i', style: TextStyle(fontSize: 12.0),))
                );
              },
            );
            }
          },
          ).toList(),
        ),
      )

      // 別パッケージを試行した名残り

      // import 'package:another_transformer_page_view/another_transformer_page_view.dart';
      // import 'transformer.dart';

      // List<Color> list = [Colors.grey,Colors.orange,Colors.lightGreen];

      // body:Center(
          // child: SizedBox(
          //   width: 325,
          //   height: 650,
          //   child: TransformerPageView(
          //     loop:true,
          //     transformer:  ScaleAndFadeTransformer(),
          //     itemBuilder: (BuildContext context, int index){
          //       return  Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(15),
          //           color: list[index%list.length],
          //         ),
          //           child:  Center(
          //             child: Text (
          //               "$index",
          //               style: const TextStyle(
          //                 fontSize: 20.0,
          //                 color: Colors.white
          //               ),
          //             ),
          //           ),
          //       );
          //     },
          //     itemCount: 3
          //   ),
          // )
      // )
    );
  }
}