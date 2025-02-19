
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tanzero/views/colors_const.dart';
import 'package:tanzero/views/common_widgets/common_buttons.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  void initState() {
    super.initState();
  }

  // LoginServices Loginobj = new LoginServices();
  bool? isChecked = false;
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    // LoginServices loginsrvobj = LoginServices();

    // logInFun() {
    //   final logSignProvider =
    //       Provider.of<LoginSignUpProvider>(context, listen: false);
    //   String? email = _emailcontroller.text.trim();
    //   String? password = _passwordcontroller.text.trim();
    //   logSignProvider.LoginProvider(email, password, context);
    // }

    // signUpUsingGoogle(context) {
    //   loginsrvobj.googleSignInServices(context);
    // }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            BackButtton(context),
            Spacer(),
            Text(
              "Log in",
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: screenWidth * 0.05),
            ),
            SizedBox(
              width: 10,
            ),
            Spacer(),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text("Email",
                            style: TextStyle(fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  TextFormField(
                      controller: _emailcontroller,
                      validator: (value) => EmailValidator.validate(value!)
                          ? null
                          : "Please enter a valid email",
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(85, 92, 92,
                                92), // Color when TextField is focused
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Secondary)),
                        fillColor: Color(0xFFffffff),
                        filled: true,
                        hintText: "Text your email",
                        hintStyle: TextStyle(color: Colors.grey),
                      )),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Password",
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: _passwordcontroller,
                        obscureText: !isPasswordVisible,
                        validator: Validators.compose([
                          Validators.required('Password is required'),
                          Validators.patternString(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                            'Invalid password',
                          ),
                        ]),
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () => setState(
                                () => isPasswordVisible = !isPasswordVisible),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Secondary, width: 1.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Secondary),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Password must be at least 8 characters with 1 uppercase, 1 lowercase, and 1 number.",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  // Container(
                  //   height: screenHeight * 0.001,
                  //   child: Checkbox(
                  //       value: isChecked,
                  //       activeColor: Colors.green,
                  //       tristate: true,
                  //       onChanged: (newBool) {
                  //         setState(() {
                  //           isChecked = newBool;
                  //         });
                  //       }),
                  // ),
                  // Text("Remember me"),
                  Spacer(),
                  // InkWell(
                  //   splashColor: Colors.transparent, // Removes the splash color
                  //   highlightColor:
                  //       Colors.transparent, // Removes the highlight color
                  //   hoverColor: Colors.transparent, // Removes the hover effect
                  //   onTap: () {
                  //     Navigator.pushNamed(context, '/Forgotpassword');
                  //   },
                  //   child: Text(
                  //     "Forgot password?",
                  //     style: TextStyle(color: Colors.grey),
                  //   ),
                  // )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // LoadingClass().changeWaiting(true);
                  // logInFun();
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 5, top: 30),
                child: MainButton1(screenWidth, screenHeight, "Log in"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Or",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  // signUpUsingGoogle(context);
                },
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.053,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: const Color.fromARGB(41, 158, 158, 158))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Google.png"),
                      Center(
                          child: Text(
                        "Continue with Google",
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w500),
                      )),
                    ],
                  ),
                ),
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                        color: const Color.fromARGB(214, 158, 158, 158)),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (ctx) {
                      //   return SignUp();
                      // }));
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       child: Consumer<LoginSignUpProvider>(
            //           builder: (context, loginSignUpProvider, child) {
            //         return loginSignUpProvider.LoginResponse == null
            //             ? Text("")
            //             : Text(
            //                 loginSignUpProvider.LoginResponse.toString(),
            //                 style: TextStyle(color: Colors.red),
            //               );
            //       }),
            //     ),
            //   ],
            // ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
