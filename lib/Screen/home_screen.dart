import 'package:flutter/material.dart';
import 'package:helper/shared_Ui/navigation_drawer.dart';
import 'home_tabs/Rental.dart';
import 'home_tabs/Home_Maintence.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: "RENTAL SUPPLIERS",
              icon: Icon(Icons.group_outlined),
            ),
            Tab(
              text: "HOME MAINTRNCE..",
              icon: Icon(Icons.engineering_rounded),
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: TabBarView(
          children: [
            Rental(),
            HomeMaintence(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
