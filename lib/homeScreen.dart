import 'package:flutter/material.dart';
import 'dart:math';

import 'package:rolling_dice/fancyButton.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int l = 1, r = 1;
  AnimationController _controller;
  Animation _curve;

  @override
  void initState() {
    super.initState();
    animation();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  animation() {
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _curve = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    _curve.addListener(() {
      print(_curve.value);
      setState(() {});
    });
    _curve.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("Completed");
        _controller.reverse();
        setState(() {
          Random random = Random();
          l = random.nextInt(6);
          r = random.nextInt(6);
        });
      }
    });
  }

  void changeDice() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Rolling Dice",
        )),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.pink[300],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onDoubleTap: changeDice,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image(
                        height: 200 - _curve.value * 200,
                        image: AssetImage("assets/images/dice${l + 1}.png"),
                      ),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onDoubleTap: changeDice,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image(
                        height: 200 - _curve.value * 200,
                        image: AssetImage("assets/images/dice${r + 1}.png"),
                      ),
                    ),
                  )),
                ],
              ),
              // SizedBox(
              //   height: 10.0,
              // ),
              // FancyButton(onPressed: changeDice),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 150.0),
            child: Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: FancyButton(onPressed: changeDice)),
          ),
        ],
      ),
    );
  }
}
