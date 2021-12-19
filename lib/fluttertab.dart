import 'package:flutter/material.dart';
class TabTest extends StatefulWidget {
  const TabTest({Key? key}) : super(key: key);

  @override
  _TabTestState createState() => _TabTestState();
}

class _TabTestState extends State<TabTest> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Test Tab bar"),
          bottom: TabBar(
            indicatorColor: Colors.black,
            tabs: [
              Tab(child: Text("Chats")),
              Tab(child: Text("Stats")),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Text("Chats"),
            Text("Status"),
          ],
        ),
      ),
    );
  }
}
