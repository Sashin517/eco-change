import 'package:flutter/material.dart';
import '../colors.dart';
import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // 👈 prevents keyboard overlap
      body: SafeArea(
        child:Stack(
        children: [
          /// Background image
          /// Background image (from network)
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.32,
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
              //height: MediaQuery.of(context).size.height * 0.66,
              decoration: const BoxDecoration(
                color: Color(0xFFB6E62E), // Eco green
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // 👈 fits height to children
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 32),
                  const Text(
                    "Sign Up for Free",
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

                  /// Name Field
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFDFF4B7),
                      hintText: "Enter your name",
                      hintStyle: TextStyle(
                        fontSize: 16, // font size of hint text
                        color: AppColors.text, // 50% faded
                      ),
                      prefixIcon: const Icon(size: 22,Icons.person),
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
                  /// Email Field
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFDFF4B7),
                      hintText: "Enter your email",
                      hintStyle: TextStyle(
                        fontSize: 16, // font size of hint text
                        color: AppColors.text, // 50% faded
                      ),
                      prefixIcon: const Icon(size: 22,Icons.email),
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
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFDFF4B7),
                      hintText: "Enter your password",
                      hintStyle: TextStyle(
                        fontSize: 16, // font size of hint text
                        color: AppColors.text, // 50% faded
                      ),
                      prefixIcon: const Icon(size: 22,Icons.lock),
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
                  /// Password Field
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFDFF4B7),
                      hintText: "Re-enter your password",
                      hintStyle: TextStyle(
                        fontSize: 16, // font size of hint text
                        color: AppColors.text, // 50% faded
                      ),
                      prefixIcon: const Icon(size: 22,Icons.lock),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white),
                      ),
                    ),
                  ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  /// Sign Up Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Do you have an account?",
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
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                          },
                        child: const Text("Login"),
                      ),
                    ],
                  ),
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
