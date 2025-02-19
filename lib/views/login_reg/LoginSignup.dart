import 'package:flutter/material.dart';
import 'package:tanzero/views/colors_const.dart';
import 'package:tanzero/views/common_widgets/common_buttons.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

// LoginServices loginsrvobj = LoginServices();
// signUpUsingGoogle(context) {
//   loginsrvobj.googleSignInServices(context);
// }

class _LoginSignupState extends State<LoginSignup> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(),
          Container(
            child: Center(
                child: Image.asset("assets/images/Frame 1171276520.png")),
          ),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          InkWell(
            splashColor: Colors.transparent, // Removes the splash color
            highlightColor: Colors.transparent, // Removes the highlight color
            hoverColor: Colors.transparent, // Removes the hover effect
            onTap: () {
              Navigator.pushNamed(context, '/LogIn');
   
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 5, top: 30),
              child: MainButton1(screenWidth, screenHeight, "Log in"),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent, // Removes the splash color
            highlightColor: Colors.transparent, // Removes the highlight color
            hoverColor: Colors.transparent, // Removes the hover effect
            onTap: () {
              Navigator.pushNamed(context, '/SignUp');

            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.053,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: primaryColor)),
                child: Center(
                    child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500),
                )),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: <Widget>[
          //       const Expanded(child: Divider()),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 15),
          //         child: Text(
          //           "Or",
          //           style: Theme.of(context).textTheme.labelMedium,
          //         ),
          //       ),
          //       const Expanded(child: Divider()),
          //     ],
          //   ),
          // ),
          // InkWell(
          //   onTap: () {
          //     signUpUsingGoogle(context);
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(
          //         left: 20, right: 20, top: 10, bottom: 10),
          //     child: Container(
          //       width: screenWidth,
          //       height: screenHeight * 0.053,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12),
          //           border: Border.all(
          //               color: const Color.fromARGB(41, 158, 158, 158))),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Image.asset("assets/images/Google.png"),
          //           Center(
          //               child: Text(
          //             "Continue with Google",
          //             style: TextStyle(
          //                 fontSize: screenWidth * 0.04,
          //                 fontWeight: FontWeight.w500),
          //           )),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          //   child: Container(
          //     width: screenWidth,
          //     height: screenHeight * 0.053,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(12),
          //         border: Border.all(
          //             color: const Color.fromARGB(41, 158, 158, 158))),
          //     child: Center(
          //         child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Image.asset("assets/images/fb.png"),
          //         Text(
          //           "Continue with Facebook",
          //           style: TextStyle(
          //               fontSize: screenWidth * 0.04,
          //               fontWeight: FontWeight.w500),
          //         ),
          //       ],
          //     )),
          //   ),
          // ),
          const Spacer()
        ],
      ),
    );
  }
}
