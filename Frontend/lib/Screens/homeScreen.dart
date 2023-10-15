import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_app/Widgets/SosButton.dart';

import '../Widgets/bottom_navigation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyBox());
  }
}

class MyBox extends StatefulWidget {
  @override
  _MyBoxState createState() => _MyBoxState();
}

class _MyBoxState extends State<MyBox> {
  double _height = 3 / 6;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onVerticalDragUpdate: (details) {
            setState(() {
              _height -= details.delta.dy / 800;
              if (_height < 3 / 6) _height = 3 / 6;
              if (_height > 1) _height = 1;
            });
          },
          child: Positioned(
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * _height,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 8, 0, 0.9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                // child: GridView.count(
                //   physics: NeverScrollableScrollPhysics(),
                //   crossAxisCount: 2,
                //   children: List.generate(6, (index) {
                //     return Visibility(
                //       visible: index < 4 || _height == 1,
                //       child: Container(
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         margin: EdgeInsets.all(10),
                //       ),
                //     );
                //   }),
                // ),
                child: calling(),
              ),
            ),
          ),
        ),
        Positioned(
          // top: 50,
          right: 20,
          left: 20,
          bottom: 250,
          child: AnimatedOpacity(
            opacity: _height < 1 ? 1 : 0,
            duration: Duration(milliseconds: 100),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              width: _height < 1 ? (1 - _height) * 1000 : 0,
              height: _height < 1 ? (1 - _height) * 1000 : 0,
              child: SOSButton(),
            ),
          ),
        ),
      ],
    );
  }
}

calling() {
  return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => {print("Calling Police ")},
              child: Container(
                height: 100,
                width: 100,
                color: Colors.amber,
                child: Image.asset('assets/images/policeicon.png'),
              ),
            ),
            GestureDetector(
              onTap: () => {print("Calling Ambulance ")},
              child: Container(
                height: 100,
                width: 100,
                color: Colors.amber,
                child: Image.asset('assets/images/policeicon.png'),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => {print("Calling Women Helpline ")},
              child: Container(
                height: 100,
                width: 100,
                color: Colors.amber,
                child: Image.asset('assets/images/policeicon.png'),
              ),
            ),
            GestureDetector(
              onTap: () => {print("Calling Fav Contacts ")},
              child: Container(
                height: 100,
                width: 100,
                color: Colors.amber,
                child: Image.asset('assets/images/policeicon.png'),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.amber,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.amber,
            )
          ],
        ),
      ],
    ),
  );
}
