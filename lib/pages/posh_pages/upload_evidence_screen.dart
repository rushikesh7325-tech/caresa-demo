import 'package:flutter/material.dart';
import 'package:firstproduction_pro/navigation/routes.dart';

class UploadEvidenceScreen extends StatelessWidget {
  const UploadEvidenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // Standardized thin back arrow as seen in your designs
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Upload Evidence',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900, // Matching the extra-bold POSH headers
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
                    // Illustration centered to match previous screens
                    Center(
                      child: Image.asset(
                        'assets/images/upload.png',
                        height: 260,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F7FF),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Icon(Icons.cloud_upload_outlined, 
                            size: 80, 
                            color: Colors.blueAccent
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Informational text with matched typography
                    const Text(
                      'You may upload screenshots, photos, documents, or other relevant files that support your report. All information will be handled confidentially.',
                      textAlign: TextAlign.left, // Left-aligned for consistency
                      style: TextStyle(
                        fontSize: 19, // Matched font size
                        height: 1.3,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Security indicator refined for clean UI
                    Row(
                      children: [
                        Icon(Icons.lock_outline, size: 16, color: Colors.grey.shade500),
                        const SizedBox(width: 8),
                        Text(
                          'End-to-end encrypted submission',
                          style: TextStyle(
                            fontSize: 14, 
                            color: Colors.grey.shade500,
                            fontStyle: FontStyle.italic
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // "Continue" button with standardized grey styling and bottom anchoring
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
                    backgroundColor: Colors.black, // Light grey matching design
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