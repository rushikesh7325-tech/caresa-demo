import 'package:flutter/material.dart';
import 'package:firstproduction_pro/navigation/routes.dart'; // Ensure your Routes class is accessible

class PoshAwarenessScreen extends StatefulWidget {
  const PoshAwarenessScreen({super.key});

  @override
  State<PoshAwarenessScreen> createState() => _PoshAwarenessScreenState();
}

class _PoshAwarenessScreenState extends State<PoshAwarenessScreen> {
  bool isChecked = false;

  // Handles navigation to the next policy page
  void _onContinue() {
    if (isChecked) {
      Navigator.pushNamed(context, Routes.poshpolicy);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Using Theme data for consistency
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Scrollable Content area
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(theme),
                  const SizedBox(height: 24),
                  _buildInfoCard(),
                  const SizedBox(height: 16),
                  _buildExamplesCard(theme),
                  const SizedBox(height: 24),
                  _buildRulesSection(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          _buildFooter(theme),
        ],
      ),
    );
  }

  // --- UI Components ---

  Widget _buildHeader(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'POSH Awareness\n& Consent',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w900,
            color: Colors.black87,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'The Prevention of Sexual Harassment (POSH) policy ensures a safe, respectful, and inclusive workplace for everyone.',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade600,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard() {
    return _StyledCard(
      color: Colors.blue.shade50.withOpacity(0.5),
      child: Row(
        children: [
          Icon(Icons.shield_outlined, color: Colors.blue.shade800),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'This policy protects all employees, interns, and contractors.',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExamplesCard(ThemeData theme) {
    return _StyledCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.orange.shade800,
                size: 22,
              ),
              const SizedBox(width: 8),
              const Text(
                'Examples of harassment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _BulletItem(
            'Unwelcome physical contact or suggestive behavior.',
          ),
          const _BulletItem(
            'Sharing offensive or non-consensual digital content.',
          ),
          const _BulletItem(
            'Abuse of authority creating a hostile environment.',
          ),
        ],
      ),
    );
  }

  Widget _buildRulesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'REMEMBER',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.grey.shade800,
          ),
        ),
        const Divider(height: 24),
        const _CheckItem('Consent must be clear & voluntary'),
        const _CheckItem('Complaints are strictly confidential'),
        const _CheckItem('Retaliation is strictly prohibited'),
      ],
    );
  }

  Widget _buildFooter(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          CheckboxListTile(
            value: isChecked,
            activeColor: Colors.black87,
            onChanged: (v) => setState(() => isChecked = v ?? false),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'I have read and understood the POSH policy.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 12),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: isChecked ? _onContinue : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isChecked
                    ? Colors.black87
                    : Colors.grey.shade300,
                elevation: isChecked ? 4 : 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Supporting Widgets (Refactored for Reusability) ---

class _StyledCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  const _StyledCard({required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _BulletItem extends StatelessWidget {
  final String text;
  const _BulletItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckItem extends StatelessWidget {
  final String text;
  const _CheckItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(Icons.check_circle_rounded, color: Colors.green, size: 20),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
