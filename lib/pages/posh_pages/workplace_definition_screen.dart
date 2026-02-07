import 'package:flutter/material.dart';
import 'package:firstproduction_pro/navigation/routes.dart';

class WorkplaceDefinitionScreen extends StatelessWidget {
  const WorkplaceDefinitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // Match the thin back arrow from the provided images
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Workplace Definition',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900, // Matching the extra bold style in images
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
                    // Illustration centered as seen in image_1ac181.jpg
                    Center(
                      child: Image.asset(
                        'assets/images/workplace.png',
                        height: 260,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0FAF0),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Icon(Icons.business_outlined, size: 80, color: Colors.green),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Definition text matching the layout in image_1ac181.jpg
                    const Text(
                      'The workplace includes the physical office, virtual work environments, work-related travel, and any location or platform where official work activities take place.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 19, // Adjusted for the visual density in screenshots
                        height: 1.3,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // "Continue" button anchored at the bottom with specific gray styling
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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