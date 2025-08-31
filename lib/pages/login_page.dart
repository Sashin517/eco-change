import 'package:flutter/material.dart';
import '../colors.dart';
import 'home.dart';
import 'signup_page.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static final TextEditingController passContoller = TextEditingController();
  static final TextEditingController emailContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // 👈 prevents keyboard overlap
      body: SafeArea(
        child: Stack(
          children: [
            /// Background image
            /// Background image (from network)
            SizedBox(
              width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.42,
            child: Image.asset(
              "assets/Garbage.jpg", 
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey.shade200,
                child: const Center(
                  child: Icon(Icons.broken_image, size: 60, color: Colors.grey),
                ),
              ),
            ),
          ),

          /// Green bottom container with login form
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              //height: MediaQuery.of(context).size.height * 0.54,
              decoration: const BoxDecoration(
                color: Color(0xFFB6E62E), // Eco green
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // 👈 fits height to children
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 32),
                  const Text(
                    "Welcome to EcoChange",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Enter details to join the change",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 25),

                  /// Email Field
                  TextField(
                    controller: emailContoller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFDFF4B7),
                      hintText: "Enter your email",
                      hintStyle: TextStyle(
                        fontSize: 16, // font size of hint text
                        color: AppColors.text, // 50% faded
                      ),
                      prefixIcon: const Icon(Icons.email, size: 22),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 14, // 👈 left & right
                        vertical: 16,   // 👈 top & bottom
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  /// Password Field
                  TextField(
                    controller: passContoller,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFDFF4B7),
                      hintText: "Enter your password",
                      hintStyle: TextStyle(
                        fontSize: 16, // font size of hint text
                        color: AppColors.text, // 50% faded
                      ),
                      prefixIcon: const Icon(Icons.lock, size: 22,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 14, // 👈 left & right
                        vertical: 16,   // 👈 top & bottom
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          ),
                        backgroundColor: const Color(0xFF3D5000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async{

                        String mail = emailContoller.text.trim();
                        String pass = passContoller.text.trim();

                        if(mail.isEmpty || pass.isEmpty) {
                          // Show an error message if fields are empty
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please enter both email and password')),
                          );
                          return;
                        }else{
                            try{
                            await FirebaseAuth.instance.signInWithEmailAndPassword(email: mail, password: pass).then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login successfully')),
                              );
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                              );  
                            });
                                                      
                          }on FirebaseAuthException catch (e) {
                            // Specific Firebase errors (better debugging)
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Signup failed: ${e.message}")),
                            );
                          } catch (err) {
                            // Any other errors
                            print("Error: $err");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("An unexpected error occurred")),
                            );
                          }
                        }
                        
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      // forgot password logic
                    },
                    child: const Text(
                      "Forgot your password?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                      "or",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16/1.618),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Add your social login logic here
                    },
                    icon: Image.asset(
                      'assets/devicon_google.png', // path to your SVG
                      width: 28,
                      height: 28,
                      //color: Colors.black, // optional if you want to tint it
                    ),
                    label: const Text(
                      "Login with Google",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  )
                  //const SizedBox(height: 64),
                    ],
                  ),
                  const SizedBox(height: 32),
                  /// Sign Up Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t you have an account?",
                         style:TextStyle(
                          fontSize: 16,
                          color: AppColors.text,
                         ),
                        ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpPage()),
                          );
                        },
                        child: const Text("Sign Up"),
                      ),
                    ],
                  ),
                  //const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
