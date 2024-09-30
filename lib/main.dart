import 'package:flutter/material.dart';
import 'package:lab/PageViewHolder.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  late PageViewHolder holder;

  late PageController _controller;
  
  double fraction = 0.90;


  @override
  void initState() {
    super.initState();
    holder = PageViewHolder(value: 2.0);
    _controller = PageController(initialPage: 2,viewportFraction: fraction);
    _controller.addListener(() {
      holder.setValue(_controller.page);
    });
    
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
        color: Colors.blueGrey[300],
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 700,
              child: Center(
                child: ChangeNotifierProvider<PageViewHolder>.value(
                  value: holder,
                  child: PageView.builder(
                    controller: _controller,
                      itemCount:3,
                      physics: BouncingScrollPhysics(),              
                      itemBuilder: (context,index){
                        return MyPage(number: index.toDouble(), fraction: fraction);
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class MyPage extends StatelessWidget {

  final List<Widget> _pages = [
    Container(
      color: Colors.green[200],
    ),
    Container(
      color: Colors.blue[200],
    ),
    Container(
      color: Colors.yellow[200],
    ),
  ];

    final double number;
    final double fraction;


    MyPage({
      required this.number,
      required this.fraction});


  @override
  Widget build(BuildContext context) {


    double value = Provider.of<PageViewHolder>(context).value;
    debugPrint("val_$value");
    debugPrint("num_$number");
    double diff = (number - value);
    debugPrint("diff_$diff");

    final Matrix4 pvMatrix = Matrix4.identity()
      ..setEntry(3, 3, 1.125)
      ..setEntry(1, 1, fraction)
      ..setEntry(3, 0, 0.0005 * diff);
      

    return Transform(
      transform: pvMatrix,
      alignment:  FractionalOffset.center,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(15)
        ),
        ), 
      );
  }
}
