import 'package:flutter/material.dart';

class UniversityVerification extends StatefulWidget {
  const UniversityVerification({super.key});

  @override
  State<UniversityVerification> createState() =>
      _CompanyVerificationState();
}
class _CompanyVerificationState extends State<UniversityVerification> {
  final TextEditingController companyController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  bool isButtonEnabled = false;

  void checkFields() {
    setState(() {
      isButtonEnabled =
          companyController.text.isNotEmpty &&
              codeController.text.isNotEmpty;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //  APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "University Verification",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // body
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // 🔹icon
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Icon(
                Icons.check_box_outlined,
                size: 40,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 30),

            // 🔹heading
            const Text(
              "Verify Your Access",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // subtitle
            const Text(
              "Your responses remain private from your university.\n"
                  "“We prioritize your mental sanctuary”",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 30),

            //cardd
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "University name :",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  _inputField(
                    hint: 'e.g. sppu',
                    icon: Icons.business,
                    controller: companyController,
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    "Enter university code or email :",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  _inputField(
                    hint: 'e.g. XYZ123 or email@university.in',
                    icon: Icons.email_outlined,
                    controller: codeController,
                  ),

                  const SizedBox(height: 20),


                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isButtonEnabled ? () {
                        // Continue action
                      } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        isButtonEnabled ? Colors.black : Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),



            const SizedBox(height: 40),
          ],
        ),
      ),

      // 🔹 FOOTER
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.lock_outline, size: 14, color: Colors.black54),
            SizedBox(width: 6),
            Text(
              "SECURE ENCRYPTED VERIFICATION",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 INPUT FIELD WIDGET
  Widget _inputField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
  }){
    return TextField(
      controller: controller,
      onChanged: (_) => checkFields(),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
