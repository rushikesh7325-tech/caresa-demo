import 'package:flutter/material.dart';
import 'package:firstproduction_pro/navigation/routes.dart';

class VisualDigitalHarassmentScreen extends StatelessWidget {
  const VisualDigitalHarassmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // Using the thin iOS-style back arrow seen in the screenshots
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Visual / Digital Harassment',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900, // Matching the heavy bold in the image
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
                    // Illustration matching the centered style
                    Center(
                      child: Image.asset(
                        'assets/images/visual.png',
                        height: 260,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F0FF),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Icon(Icons.devices_outlined, size: 80, color: Colors.deepPurpleAccent),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Descriptive Text matching the image alignment and density
                    const Text(
                      'Visual or digital harassment includes sending, showing, or displaying inappropriate images, messages, gestures, or online content that causes discomfort or harm.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 19, // Matches the visual weight in the image
                        height: 1.3,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // "Continue" button anchored at the bottom with specific grey styling
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.reportcompliant);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Light grey matching image
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: Colors.black12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}