import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage4 extends StatefulWidget {
  //final String title;

  //MyHomePage3({Key key, this.title}) : super(key: key);
//  MyHomePage3() {}

  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyHomePage4> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;
  Timer _crossFadeTimer;

  @override
  Widget build(BuildContext context) {
    final image0 = Image.network(
      'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png',
      width: 180.0,
      height: 180.0,
    );
    final image1 = Image.asset('images/takefu.png');
    return Scaffold(
      body: Container(
        child: AnimatedCrossFade(
          firstChild: image0,
          secondChild: image1,
          duration: Duration(seconds: 1),
          crossFadeState: _crossFadeState,
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_crossFadeTimer != null) {
      _crossFadeTimer.cancel();
      _crossFadeTimer = null;
    }
    super.dispose();
  }

  @override
  void initState() {
    _crossFadeTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        if (_crossFadeState == CrossFadeState.showFirst) {
          _crossFadeState = CrossFadeState.showSecond;
        } else {
          _crossFadeState = CrossFadeState.showFirst;
        }
      });
    });

    super.initState();
  }
}
