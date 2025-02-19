import 'package:flutter/material.dart';
import 'package:tanzero/views/common_widgets/common_buttons.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
             BackButtton(context),
              const Spacer(),
              Text(
                "Forgot Password",
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: screenWidth * 0.05),
              ),
              const SizedBox(
                width: 10,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: const Text(
                          "Enter the email associated with your account and we’ll",
                          maxLines: 1,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: const Text(
                          "send an email with code to reset your password",
                          maxLines: 1,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Text("Email",
                          style: TextStyle(fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
                TextField(
                    onChanged: (value) {
                      // Method For Searching
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(85, 92, 92,
                              92), // Color when TextField is focused
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      fillColor: const Color(0xFFffffff),
                      filled: true,
                      hintText: "Text your email",
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    )),
              ],
            ),
          ),
          InkWell(
            splashColor: Colors.transparent, // Removes the splash color
            highlightColor: Colors.transparent, // Removes the highlight color
            hoverColor: Colors.transparent, // Removes the hover effect
            onTap: () {
              Navigator.pushNamed(context, '/VerifyOTP');
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 5, top: 20),
              child: MainButton1(screenWidth, screenHeight, "Confirm"),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
