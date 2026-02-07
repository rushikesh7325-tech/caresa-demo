import 'package:flutter/material.dart';

class ContactOfficerPage extends StatelessWidget {
  const ContactOfficerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Contact POSH Officer",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 25),

            // Info Group
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE5E5E5),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.lock_outline, color: Colors.black),
                    title: Text("Your communication is confidential"),
                  ),
                  Divider(height: 1, color: Colors.grey),
                  ListTile(
                    leading: Icon(Icons.track_changes, color: Colors.black),
                    title: Text("Response within 48 hrs."),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Assistance Group
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE5E5E5),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text("Contact for assistance",
                        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                  ),
                  const Divider(height: 1, color: Colors.grey),
                  _buildActionTile(Icons.email_outlined, "Email", "icc@company.com"),
                  const Divider(height: 1, color: Colors.grey),
                  _buildActionTile(Icons.assignment_outlined, "Secure Form", "Submit an anonymous report"),
                ],
              ),
            ),
            const SizedBox(height: 30),

            const Text("What's Next?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.radio_button_off),
              title: Text("Internal review by the POSH committee."),
            ),
            const ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text("Possible follow-up for further details."),
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text("All conversation remain confidential.",
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(IconData icon, String title, String sub) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(sub),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}