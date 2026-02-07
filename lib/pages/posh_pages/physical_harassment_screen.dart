import 'package:flutter/material.dart';
import 'package:firstproduction_pro/navigation/routes.dart';

class PhysicalHarassmentScreen extends StatelessWidget {
  const PhysicalHarassmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Physical Harassment',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(flex: 1),
              
              // Central Illustration
              Center(
                child: Image.asset(
                  'assets/images/physical.png',
                  height: 260,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFBFA), // Subtle red tint
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.red.shade50),
                      ),
                      child: Icon(Icons.front_hand_rounded, size: 80, color: Colors.red.shade300),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Descriptive Text
              const Text(
                'Physical harassment includes unwanted physical contact such as touching, pushing, hitting, blocking movement, or any action that violates personal space or safety.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              const Spacer(flex: 3),
              
              // Navigation Button
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, Routes.reportcompliant),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87, // High contrast for action
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Continue to Report',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}