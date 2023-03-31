import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController? transitionAnimation;
  AnimationController? transitionAnimation2;

  @override
  void initState() {
    super.initState();
    transitionAnimation = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    transitionAnimation2 = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    transitionAnimation!.forward();
    transitionAnimation!.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        // transitionAnimation2!.forward();
      } else if (status == AnimationStatus.completed) {
        if (kDebugMode) {
          print('Status Listener : ${status.toString()}');
        }
        transitionAnimation!.repeat();
      }
    });

    transitionAnimation2!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        transitionAnimation2!.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth * 0.6;
          var ballWidth = width * 0.05;
          var ballWidthSpeed = ballWidth * 0.089;
          return Center(
            child: Container(
              color: Colors.grey,
              width: width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: AnimatedBuilder(
                      animation: transitionAnimation!,
                      builder: (context, child) {
                        return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0),
                              end: Offset(ballWidthSpeed, 0),
                            ).animate(CurvedAnimation(
                                curve: const Interval(0, 0.01,
                                    curve: Curves.easeIn),
                                parent: transitionAnimation!)),
                            child: child);
                      },
                      child: Row(
                        children: [
                          Container(
                            height: ballWidth,
                            width: ballWidth,
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                          ),
                          Container(
                            height: ballWidth,
                            width: ballWidth,
                            decoration: const BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                          ),
                          Container(
                            height: ballWidth,
                            width: ballWidth,
                            decoration: const BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                          ),
                          Container(
                            height: ballWidth,
                            width: ballWidth,
                            decoration: const BoxDecoration(
                                color: Colors.blue, shape: BoxShape.circle),
                          ),
                          Container(
                            height: ballWidth,
                            width: ballWidth,
                            decoration: const BoxDecoration(
                                color: Colors.purple, shape: BoxShape.circle),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: AnimatedBuilder(
                      animation: transitionAnimation2!,
                      builder: (context, child) {
                        return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-1, 0),
                              end: Offset(
                                  (MediaQuery.of(context).size.width /
                                      ballWidth),
                                  0),
                            ).animate(CurvedAnimation(
                                curve:
                                    const Interval(0, 1, curve: Curves.easeIn),
                                parent: transitionAnimation2!)),
                            child: child);
                      },
                      child: Container(
                        height: ballWidth,
                        width: ballWidth,
                        decoration: const BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   left: 0,
                  //   child: AnimatedBuilder(
                  //     animation: transitionAnimation!,
                  //     builder: (context, child) {
                  //       return SlideTransition(
                  //           position: Tween<Offset>(
                  //             begin: const Offset(-1, 0),
                  //             end: const Offset(0, 0),
                  //           ).animate(CurvedAnimation(
                  //               curve:
                  //               const Interval(.01, 0.25, curve: Curves.easeInExpo),
                  //               parent: transitionAnimation!)),
                  //           child: child);
                  //     },
                  //     child: Container(
                  //       height: MediaQuery.of(context).size.height,
                  //       width: MediaQuery.of(context).size.width * 0.15,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
//           Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => FirstPage(),
//           ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
