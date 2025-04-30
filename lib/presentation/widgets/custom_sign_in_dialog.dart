import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive_animations/presentation/pages/sign_in_form.dart';

Future<Object?> customSignInDialog(
  BuildContext context, {
  required ValueChanged onClosed,
}) {
  return showGeneralDialog(
    barrierLabel: "Sign In",
    barrierDismissible: true,
    context: context,
    transitionDuration: Duration(milliseconds: 400),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: Offset(0, 1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder:
        (context, _, __) => Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            height: 650,
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.94),
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                clipBehavior: Clip.none,
                children: [
                  SingleChildScrollView(
                    reverse: true,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Sign In',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 34,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SignInForm(),
                            Row(
                              children: [
                                Expanded(child: Divider()),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(color: Colors.black26),
                                  ),
                                ),
                                Expanded(child: Divider()),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                'Sign up with Email, Apple or Google',
                                style: TextStyle(color: Colors.black26),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/email_box.svg',
                                    height: 64,
                                    width: 64,
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/apple_box.svg',
                                    height: 64,
                                    width: 64,
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/google_box.svg',
                                    height: 64,
                                    width: 64,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -68,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.close, size: 20, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  ).then(onClosed);
}
