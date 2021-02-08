import 'package:flutter/material.dart';
import 'Category_card.dart';

class Rental extends StatefulWidget {
  @override
  _RentalState createState() => _RentalState();
}

class _RentalState extends State<Rental> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 48, right: 48),
                  child: Text(
                    'Online Rental',
                    style: TextStyle(
                      fontFamily: 'YuseiMagic',
                      color: Color(0xff925e78),
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 36, right: 36),
                  child: Text(
                    'FOR ALL PRDUCTS IN YOUR HOME',
                    style: TextStyle(
                        fontFamily: 'YuseiMagic',
                        color: Color(0xff925e78),
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        //start
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'Rental Categories',
            style: TextStyle(
                fontSize: 30,
                color: Color(0xff925e78),
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 350,
          child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              //Electronics
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('electronic');
                },
                child: GridTile(
                    child: CategoryCard(
                        Image.asset(
                          'images/electronics.png',
                          width: 110,
                          height: 110,
                        ),
                        'Electronics')),
              ),
              //Home
              InkWell(
                onTap: () {},
                child: GridTile(
                    child: CategoryCard(
                        Image.asset(
                          'images/house.png',
                          width: 110,
                          height: 110,
                        ),
                        'Home')),
              ),
              //Tools
              InkWell(
                onTap: () {},
                child: GridTile(
                    child: CategoryCard(
                        Image.asset(
                          'images/tools-and-utensils.png',
                          width: 110,
                          height: 110,
                        ),
                        'Tools')),
              ),
              //Games
              InkWell(
                onTap: () {},
                child: GridTile(
                    child: CategoryCard(
                        Image.asset(
                          'images/puzzle.png',
                          width: 110,
                          height: 110,
                        ),
                        'Games')),
              ),
              //Others
              InkWell(
                onTap: () {},
                child: GridTile(
                    child: CategoryCard(
                        Image.asset(
                          'images/other.png',
                          width: 110,
                          height: 110,
                        ),
                        'Others')),
              ),
            ],
          ),
        )
      ],
    );
  }
}
