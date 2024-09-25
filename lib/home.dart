import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class TestPage{
  final String name;

  final String description;

  TestPage(this.name, this.description);
}

final models = [
  TestPage('test1', '1ページ目'),
  TestPage('test2', '2ページ目'),
  TestPage('test3', '3ページ目'),
  TestPage('test4', '4ページ目'),
  TestPage('test5', '5ページ目'),
];

class TestTest extends StatelessWidget{
  const TestTest({
    super.key,
    required this.model,
  });

  final TestPage model;

  @override
  Widget build(BuildContext context){
  return Container(
      decoration: BoxDecoration(
        // 色
        color: Colors.blueGrey,
        // 角丸
        borderRadius: BorderRadius.circular(20),
        // 影
        boxShadow: [
          BoxShadow(
            // 影の設定
            color: Colors.black.withOpacity(0.2), //色
            spreadRadius: 2, // 広がりの大きさ
            blurRadius: 2, // ぼかしの強さ
            offset: const Offset(0, 2), // 方向
          ),
        ],
      ),
    );
  }
}

Widget modelToWidget(TestPage model) {

  // ページの部分
  return Container(
    // カードの周りに 10 ずつスペースを空ける
    padding: const EdgeInsets.fromLTRB(10,50,10,50),
    // 中身は カード
    child: TestTest(model: model),
  );
  // カードを使う
}



class Home extends StatefulWidget{
  const Home({super.key});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double x = 0;
  double y = 0;
  double z = 0;

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final carousel =PageView.builder(
      controller: PageController(
        viewportFraction: 0.8,
      ),
      itemCount: models.length,
      itemBuilder: (c, i) => modelToWidget(models[i]),
      onPageChanged: (int page){
        setState(() {
          _currentPage = page;
        });
        print(_currentPage);
      },
    );
    return  Scaffold(
      body:Center(
        child: Container(
          height: 730,
          child: carousel,
        ),
      ),
    );
  }
}
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