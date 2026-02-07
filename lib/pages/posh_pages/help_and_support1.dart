import 'package:flutter/material.dart';
import './help_and_support2.dart';
import './help_and_support3.dart';

class HelpHomeScreen extends StatelessWidget {
  const HelpHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help and Support"),
        leading: const Icon(Icons.chevron_left, size: 30),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column( // Column fixes your 'children' error
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 30),
            const Text("Support Channels", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            const Divider(),
            _buildTile(context, Icons.person_outline, "POSH Officer", const ContactOfficerPage()),
            _buildTile(context, Icons.notifications_none, "Emergency Helpline", const EmergencyPage()),
            _buildTile(context, Icons.psychology_outlined, "Mental health Support", null),
            _buildTile(context, Icons.warning_amber_rounded, "Report Retaliation", null),
            const SizedBox(height: 20),
            const Text("Safety Resources", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            const Divider(),
            _buildTile(context, Icons.verified_user_outlined, "Workplace Safety", null),
            _buildTile(context, Icons.description_outlined, "Anti-Harassment Policy", null),
            _buildTile(context, Icons.favorite_border, "Mental Wellness", null),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, IconData icon, String title, Widget? target) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon, color: Colors.black),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: () {
            if (target != null) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => target));
            }
          },
        ),
        const Divider(height: 1),
      ],
    );
  }
}