import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('images/bg1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        child: Image(
                          image: ExactAssetImage('images/bg2.png'),
                          height: (210),
                          width: (200),
                        ),
                        offset: Offset(0, -30),
                      ),
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontFamily: 'YuseiMagic',
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 48, right: 48, top: 10),
                        child: Text(
                          'Everything you need in your house from here',
                          style: TextStyle(
                            fontFamily: 'YuseiMagic',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: 1,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: SizedBox(
                width: 350,
                height: 45,
                child: RaisedButton(
                  color: Color(0xffa4b3bb),
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                        fontFamily: 'YuseiMagic',
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 1.3),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('home');
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
