import 'package:flutter/material.dart';
import 'package:firstproduction_pro/navigation/routes.dart';

class VerbalHarassmentScreen extends StatefulWidget {
  const VerbalHarassmentScreen({super.key});

  @override
  State<VerbalHarassmentScreen> createState() => _VerbalHarassmentScreenState();
}

class _VerbalHarassmentScreenState extends State<VerbalHarassmentScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onContinue() {
    Navigator.pushNamed(context, Routes.reportcompliant);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // Match the thin back arrow from the image
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Verbal Harassment',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    // Illustration matching the centered style in the image
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Center(
                        child: Image.asset(
                          'assets/images/verbal.png',
                          height: 260,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              _buildPlaceholderIcon(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Descriptive Text matching the image alignment
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: const Text(
                        'Verbal harassment involves using abusive language, yelling, insulting, humiliating, or offensive language that causes emotional distress or creates an uncomfortable work environment.',
                        textAlign:
                            TextAlign.left, // Left aligned text per image
                        style: TextStyle(
                          fontSize:
                              19, // Slightly larger font size to match image
                          height: 1.3,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // "Continue" button anchored at the bottom with specific styling
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
              child: _buildContinueButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderIcon() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Icon(
        Icons.forum_outlined,
        size: 80,
        color: Color(0xFF4A90E2),
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: _onContinue,
        style: ElevatedButton.styleFrom(
          // Match the light grey/muted color from the image
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(
          'Continue', // Text matches the provided image
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
