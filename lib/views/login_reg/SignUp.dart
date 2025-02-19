
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tanzero/views/colors_const.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  // void _signUp() {
  //   if (_formKey.currentState?.validate() ?? false) {
  //     final logSignProvider =
  //         Provider.of<LoginSignUpProvider>(context, listen: false);
  //     logSignProvider.siginUpProvider(
  //       _firstnameController.text.trim(),
  //       _lastnameController.text.trim(),
  //       _emailController.text.trim(),
  //       _phoneController.text.trim(),
  //       _passwordController.text.trim(),
  //       context,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
      automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: screenWidth * 0.05,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInputField(
                      controller: _firstnameController,
                      label: "First Name",
                      hint: "Enter your first name",
                      validator: Validators.compose([
                        Validators.required('First name is required'),
                        Validators.patternString(
                            r'^[a-zA-Z\s]+$', 'Invalid First Name'),
                      ]),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _buildInputField(
                      controller: _lastnameController,
                      label: "Last Name",
                      hint: "Enter your last name",
                      validator: Validators.compose([
                        Validators.required('Last name is required'),
                        Validators.patternString(
                            r'^[a-zA-Z\s]+$', 'Invalid Last Name'),
                      ]),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _buildInputField(
                      controller: _emailController,
                      label: "Email",
                      hint: "Enter your email",
                      validator: (value) => EmailValidator.validate(value ?? '')
                          ? null
                          : "Invalid email",
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _buildInputField(
                      controller: _phoneController,
                      label: "Phone Number",
                      hint: "Enter your phone number",
                      keyboardType: TextInputType.phone,
                      validator: (value) => (value != null && value.length >= 10 && value.length <= 10)
                          ? null
                          : "Invalid phone number",
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _buildPasswordField(),
                    SizedBox(height: screenHeight * 0.03),
                    InkWell(
                      // onTap: _signUp,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight * 0.053,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    )
                    // ElevatedButton(
                    //   onPressed: _signUp,
                    //   child: const Text("Sign Up"),
                    //   style: ElevatedButton.styleFrom(
                    //     padding: const EdgeInsets.symmetric(vertical: 15),
                    //     minimumSize: Size(double.infinity, 50),
                    //   ),
                    // ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Secondary, width: 1.0),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Secondary),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password", style: const TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(height: 5),
        TextFormField(
          controller: _passwordController,
          obscureText: !isPasswordVisible,
          validator: Validators.compose([
            Validators.required('Password is required'),
            Validators.patternString(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
              'Invalid password',
            ),
          ]),
          decoration: InputDecoration(
            hintText: "Enter your password",hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: IconButton(
              icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () =>
                  setState(() => isPasswordVisible = !isPasswordVisible),
            ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Secondary, width: 1.0),
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
    );
  }
}
