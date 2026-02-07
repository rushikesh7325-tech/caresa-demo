import 'package:flutter/material.dart';

class HelpSupportScreen4 extends StatelessWidget {
  const HelpSupportScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  // ICON
                  const Icon(
                    Icons.psychology_outlined,
                    size: 80,
                    color: Colors.black,
                  ),

                  const SizedBox(height: 16),

                  // TITLE
                  const Text(
                    'Mental Health Support',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // MAIN CARD
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        _topTextTile(),

                        _divider(),

                        _supportTile(
                          icon: Icons.access_time,
                          text: 'Available 24/7',
                          onTap: () {
                            debugPrint('Available 24/7 tapped');
                          },
                        ),

                        _divider(),

                        _supportTile(
                          icon: Icons.chat_bubble_outline,
                          text: 'Chat with counselor',
                          onTap: () {
                            debugPrint('Chat with counselor tapped');
                          },
                        ),

                        _divider(),

                        _supportTile(
                          icon: Icons.support_agent,
                          text: 'Call Support',
                          onTap: () {
                            debugPrint('Call Support tapped');
                          },
                        ),

                        _divider(),

                        _supportTile(
                          icon: Icons.menu_book_outlined,
                          text: 'Self-Help Resources',
                          onTap: () {
                            debugPrint('Self-Help Resources tapped');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // FOOTER
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.lock_outline, size: 16),
                SizedBox(width: 6),
                Text(
                  'All conversation remain confidential.',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------- WIDGETS ----------

  static Widget _topTextTile() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'Speak confidentially with trained counselors',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget _supportTile({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }

  static Widget _divider() {
    return Divider(
      height: 1,
      color: Colors.grey.shade400,
    );
  }
}

