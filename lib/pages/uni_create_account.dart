import 'package:flutter/material.dart';

class UniCreateAccountScreen extends StatefulWidget {
  const UniCreateAccountScreen({super.key});

  @override
  State<UniCreateAccountScreen> createState() => _UniCreateAccountScreenState();
}

class _UniCreateAccountScreenState extends State<UniCreateAccountScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create Your Account',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, letterSpacing: -1),
            ),
            const Text(
              'Onboard to a More Balanced Life....',
              style: TextStyle(fontSize: 16, color: Colors.grey, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 30),

            // Form Fields
            _buildLabel("Full Name"),
            _buildCustomTextField(hint: "John Smith"),
            
            _buildLabel("Email Address"),
            _buildCustomTextField(hint: "email@example.com"),
            
            _buildLabel("Password"),
            _buildCustomTextField(
              hint: "••••••", 
              isPassword: true, 
              isVisible: _isPasswordVisible,
              onToggle: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
            ),
            
            _buildLabel("University"),
            _buildCustomTextField(hint: "DTU"),

            const SizedBox(height: 40),

            // Create Account Button
            _buildMainButton(),

            const SizedBox(height: 30),
            _buildSocialDivider(),
            const SizedBox(height: 30),

            // Social Buttons
            _buildSocialButton("Continue with Google", "assets/google_logo.png", Icons.g_mobiledata),
            const SizedBox(height: 15),
            _buildSocialButton("Continue with ios", "", Icons.apple),

            const SizedBox(height: 20),
            _buildFooter(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- UI Helper Widgets ---

  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8, top: 16),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
  );

  Widget _buildCustomTextField({required String hint, bool isPassword = false, bool? isVisible, VoidCallback? onToggle}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword && !(isVisible ?? false),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: isPassword ? IconButton(
            icon: Icon(isVisible! ? Icons.visibility : Icons.visibility_outlined, color: Colors.grey),
            onPressed: onToggle,
          ) : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  Widget _buildMainButton() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ]
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD1D1D1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 0,
        ),
        child: const Text('Create Account', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildSocialDivider() {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("OR SIGN UP WITH", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildSocialButton(String label, String assetPath, IconData icon) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black, size: 28),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: RichText(
          text: const TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(color: Colors.grey, fontSize: 14),
            children: [
              TextSpan(text: 'Log In', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}