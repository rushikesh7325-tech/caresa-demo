import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

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
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Shield Image from assets
          Center(
            child: Image.asset(
              'assets/images/shield.png',
              height: 100,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Emergency Helpline",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Text(
              "Use these numbers in cases of immediate danger for quick assistance.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87, height: 1.4),
            ),
          ),

          // Number Group in Grey Container
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: const Color(0xFFE5E5E5), // Exact grey from UI
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                _buildNumberTile("1091", "Women's Helpline"),
                const Divider(height: 1, color: Colors.grey),
                _buildNumberTile("112", "General Emergency"),
              ],
            ),
          ),

          const Spacer(),

          // Green Action Button
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5CE1A0), // Figma Green
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Call Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const Center(
            child: Text(
              "All conversation remain confidential.",
              style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildNumberTile(String number, String label) {
    return ListTile(
      leading: const Icon(Icons.call_outlined, color: Colors.black),
      title: Text(
        number,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(label),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: () {},
    );
  }
}