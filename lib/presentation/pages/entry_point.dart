import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:rive_animations/common/widgets/bottom_nav.dart';
import 'package:rive_animations/common/widgets/rive_utils.dart';
import 'package:rive_animations/common/widgets/side_menu.dart';
import 'package:rive_animations/common/widgets/side_menu_btn.dart';
import 'package:rive_animations/presentation/pages/home_screen.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  late SMIBool isSideMenuClosed;

  bool isDrawerClosed = true;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..addListener(() {
      setState(() {});
    });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17203A),
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            height: MediaQuery.of(context).size.height,
            width: 288,
            left: isDrawerClosed ? -288 : 0,
            child: SideMenu(),
          ),
          Transform(
            alignment: Alignment.center,
            transform:
                Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  //rotate 30 degree
                  ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child:
                      isDrawerClosed
                          ? HomeScreen()
                          : GestureDetector(
                            onTap: () {
                              isSideMenuClosed.value = !isSideMenuClosed.value;
                              _animationController.reverse();
                              setState(() {
                                isDrawerClosed = isSideMenuClosed.value;
                              });
                            },
                            child: HomeScreen(),
                          ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: 16,
            left: isDrawerClosed ? 0 : 220,
            curve: Curves.fastOutSlowIn,
            child: SideMenuBtn(
              press: () {
                isSideMenuClosed.value = !isSideMenuClosed.value;
                if (isDrawerClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                setState(() {
                  isDrawerClosed = isSideMenuClosed.value;
                });
              },
              riveOnInit: (artboard) {
                StateMachineController controller = RiveUtils.getRiveController(
                  artboard,
                  stateMachineName: "State Machine",
                );
                isSideMenuClosed = controller.findSMI("isOpen") as SMIBool;
                isSideMenuClosed.value = true;
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: BottomNav(),
      ),
    );
  }
}
