import 'package:flutter/material.dart';

class HelpAndSupport5 extends StatelessWidget {
  const HelpAndSupport5({super.key});

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
                  const SizedBox(height: 20),

                  // WARNING ICON
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.warning_amber_rounded,
                      size: 48,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // TITLE
                  const Text(
                    'Facing Retaliation?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // CARD
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        _headerTile(),

                        _divider(),

                        _optionTile(
                          icon: Icons.lock_outline,
                          text:
                          'Your report is encrypted and kept confidential',
                          onTap: () {
                            debugPrint('Encrypted report tapped');
                          },
                        ),

                        _divider(),

                        _optionTile(
                          icon: Icons.verified_user_outlined,
                          text:
                          'Your identity is hidden from managers or colleagues',
                          onTap: () {
                            debugPrint('Identity hidden tapped');
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
                  'All reports are securely encrypted and anonymous.',
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

  static Widget _headerTile() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'What’s Next?',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget _optionTile({
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



