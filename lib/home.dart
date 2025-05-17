import 'package:animated_app/home2.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated App')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },

          // AnimatedContainer
          // child: AnimatedContainer(
          //   duration: Duration(seconds: 1),
          //   height: _isExpanded ? 200 : 100,
          //   width: _isExpanded ? 200 : 100,
          //   color: _isExpanded ? Colors.blue : Colors.amber,
          //   curve: Curves.easeInOut,
          //   child: Text('Tap Me'),
          // ),
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: _isExpanded ? 200 : 100,
                width: _isExpanded ? 200 : 100,
                color: _isExpanded ? Colors.blue : Colors.amber,
                curve: Curves.easeInOut,
                child: Text('Tap Me'),
              ),

              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 300),
                duration: Duration(seconds: 3),
                builder: (Context, value, child) {
                  print('value tween : $value');
                  return Container(
                    width: value,
                    height: value,
                    color: Colors.blue,
                    child: Text('Tween Animasi'),
                  );
                },
              ),

              FilledButton(
                onPressed: () {
                  // Animasi perpindahan
                  Navigator.of(context).push(_createRoute());
                },
                child: Text('Go To Home2'),
              ),
            ],
          ),

          // TweenAnimationBuilder bisa menganimasikan nilai awal dan nilai akhir
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Home2Page(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween(begin: Offset(1.0, 0), end: Offset.zero);
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
