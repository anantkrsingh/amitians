import 'package:amitians/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  final _pages = [
    Center(
      child: Container(
        child: Text('Home'),
      ),
    ),
    Text("Message"),
    Text("Fav List"),
    Text("Profile")
  ];
  void _changePageTo(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: 80.0,
        width: double.infinity,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(color: kWhite),
        
      ),
    );
  }
}
