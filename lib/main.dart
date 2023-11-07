import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kitcamp2023/timeline/calender.dart';
import 'package:kitcamp2023/role/role.dart';
import 'package:kitcamp2023/talk_box.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screen = [const Calender(), const Role(), const TalkBox()];
    return Scaffold(
      extendBody: true,
      body: screen[_currentIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF333A47),
        indicatorColor: Colors.white70,
        selectedIndex: _currentIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (index) => setState(() {
          _currentIndex = index;
        }),
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Color(0xFF333A47),
            ),
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white70,
            ),
            label: 'First',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.account_box,
              color: Color(0xFF333A47),
            ),
            icon: Icon(
              Icons.account_box_outlined,
              color: Colors.white70,
            ),
            label: 'Second',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.inventory_2,
              color: Color(0xFF333A47),
            ),
            icon: Icon(
              Icons.inventory_2_outlined,
              color: Colors.white70,
            ),
            label: 'Third',
          ),
        ],
      ),
    );
  }
}
