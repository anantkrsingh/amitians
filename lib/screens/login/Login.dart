import "dart:ui";
import 'package:amitians/screens/login/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import '../onboarding_screen/widgets/animated_btn.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
              // height: 100,
              bottom: 200,
              left: 100,
              width: MediaQuery.of(context).size.width * 1.7,
              child: Image.asset("assets/Backgrounds/Spline.png")),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SizedBox(),
          )),
          const Positioned(
              child: RiveAnimation.asset("assets/RiveAssets/shapes.riv")),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: SizedBox(),
          )),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                SizedBox(
                  width: 260,
                  child: Column(
                    children: const [
                      Text(
                        "Learn design & Code",
                        style: TextStyle(
                            fontSize: 60, fontFamily: "Poppins", height: 1.2),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                          "Don't skip design. Learn Design and code, by building real apps with flutter and Swift . Complete courses about the best tools ")
                    ],
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                AnimatedBtn(
                  btnAnimationController: _btnAnimationController,
                  press: () {
                    _btnAnimationController.isActive = true;
                    Future.delayed(const Duration(milliseconds: 500), () {
                      LoginDialog(context);
                    });
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                      "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hoursof videos, source files and certificates"),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  Future<Object?> LoginDialog(BuildContext context) {
    return showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: "Sign In",
        context: context,
        transitionDuration: const Duration(milliseconds: 400),
        transitionBuilder: (ctx, anim1, anim2, child) {
          return FadeTransition(
            opacity: anim1,
            child: child,
          );
        },
        pageBuilder: (context, _, __) => Center(
              child: Container(
                height: 620,
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Sign In ",
                            style:
                                TextStyle(fontSize: 34, fontFamily: "Poppins"),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            child: Text(
                              "Explore The Amity University Beyond Your Regin and know what is going in Worldwide",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SignIn(),
                          Row(
                            children: const [
                              Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  "OR",
                                  style: TextStyle(color: Colors.black26),
                                ),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              "Sign up With Email, Google or Facebook",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    "assets/icons/email.svg",
                                    height: 64,
                                    width: 64,
                                  )),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    "assets/icons/google.svg",
                                    height: 64,
                                    width: 64,
                                  )),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    "assets/icons/facebook.svg",
                                    height: 64,
                                    width: 64,
                                  ))
                            ],
                          )
                        ],
                      ),
                      const Positioned(
                        bottom: -48,
                        left: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
