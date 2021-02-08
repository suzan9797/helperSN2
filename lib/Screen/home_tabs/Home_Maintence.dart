import 'package:flutter/material.dart';

class HomeMaintence extends StatefulWidget {
  @override
  _HomeMaintenceState createState() => _HomeMaintenceState();
}

class _HomeMaintenceState extends State<HomeMaintence> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHeader(),
          _drawManu(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(
      color: Color(0xff925e78),
      fontSize: 30,
      fontWeight: FontWeight.w600,
    );
    TextStyle _headerDescription = TextStyle(
      color: Color(0xff925e78),
      fontSize: 17,
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('images/backgraound.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 1, right: 150, top: 33),
              child: Text(
                'Quick Services',
                style: _headerTitle,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawManu() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20),
            child: Text(
              'Gategory:',
              style: TextStyle(
                color: Color(0xff925e78),
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            height: 350,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  InkWell(
                    child: GridTile(
                      child: Image.asset('images/carpentry.png'),
                      footer: Container(
                        child: Text(
                          'Carpentry',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Color((0xff6e475b)),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed("Carpentry");
                    },
                  ),
                  InkWell(
                    child: GridTile(
                      child: Image.asset('images/grass.png'),
                      footer: Container(
                        child: Text(
                          'Grass',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Color((0xff6e475b)),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed("Grass");
                    },
                  ),
                  InkWell(
                    child: GridTile(
                      child: Image.asset('images/painting.png'),
                      footer: Container(
                        child: Text(
                          'Painting',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Color((0xff6e475b)),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed("Painting");
                    },
                  ),
                  InkWell(
                    child: GridTile(
                      child: Image.asset('images/plumbing.png'),
                      footer: Container(
                        child: Text(
                          'Plumbing',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Color((0xff6e475b)),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed("Plumbing");
                    },
                  ),
                  InkWell(
                    child: GridTile(
                      child: Image.asset('images/electrical.png'),
                      footer: Container(
                        child: Text(
                          'Electrical',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Color((0xff6e475b)),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed("Electrical");
                    },
                  ),
                  InkWell(
                    child: GridTile(
                      child: Image.asset('images/AirCondition.png'),
                      footer: Container(
                        child: Text(
                          'A/C',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Color((0xff6e475b)),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed("AirCondition");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
