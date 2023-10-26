import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kitcamp2023/calender.dart';
import 'package:kitcamp2023/role.dart';
import 'package:kitcamp2023/talk_box.dart';

void main() {
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
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    var screen = [const Calender(), const Role(), const TalkBox()];
    return Scaffold(
      extendBody: true,
      body: screen[_selectedTab.index],
      bottomNavigationBar: DotNavigationBar(
        margin: const EdgeInsets.only(left: 5, right: 5),
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        dotIndicatorColor: const Color(0xFF333A47),
        backgroundColor: Colors.teal[200],
        unselectedItemColor: Colors.grey[300],
        splashBorderRadius: 50,
        // enableFloatingNavBar: false,
        onTap: _handleIndexChanged,
        items: [
          /// Home
          DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: const Color(0xFF333A47),
              unselectedColor: Colors.white70),

          /// Likes
          DotNavigationBarItem(
              icon: Icon(Icons.favorite),
              selectedColor: const Color(0xFF333A47),
              unselectedColor: Colors.white70),

          /// Search
          DotNavigationBarItem(
              icon: Icon(Icons.search),
              selectedColor: const Color(0xFF333A47),
              unselectedColor: Colors.white70),
        ],
      ),
    );
  }
}

// ignore: constant_identifier_names
enum _SelectedTab { home, favorite, search }
