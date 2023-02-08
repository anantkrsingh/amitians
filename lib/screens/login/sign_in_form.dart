import 'package:amitians/screens/user/HomeScreen.dart';
import 'package:amitians/utils/rive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key? key,
  }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isShowLoading = false;
  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (email) {},
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset("assets/icons/email.svg"),
                  )),
                ),
              ),
              Text(
                "Password",
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (password) {},
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset("assets/icons/password.svg"),
                  )),
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      isShowLoading = true;
                    });
                    Future.delayed(Duration(seconds: 1), () {
                      if (_formKey.currentState!.validate()) {
                        check.fire();
                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            isShowLoading = false;
                          });
                        });
                        Future.delayed(Duration(seconds: 1), () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        });
                      } else {
                        error.fire();
                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            isShowLoading = false;
                          });
                        });
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  icon: Icon(CupertinoIcons.arrow_right),
                  label: Text("Sign In"))
            ],
          )),
      isShowLoading
          ? CustomPositioned(
              child: RiveAnimation.asset("assets/RiveAssets/check.riv",
                  onInit: ((artboard) {
                StateMachineController controller = RiveUtils.getRiveController(artboard);
                check = controller.findSMI("Check") as SMITrigger;
                error = controller.findSMI("Error") as SMITrigger;
                reset = controller.findSMI("Reset") as SMITrigger;
              })),
            )
          : SizedBox()
    ]);
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});
  final Widget child;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            width: size,
            height: size,
            child: child,
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
