import 'package:flutter/material.dart';
import 'package:firstproduction_pro/navigation/routes.dart';

class PoshPolicyScreen extends StatefulWidget {
  const PoshPolicyScreen({super.key});

  @override
  State<PoshPolicyScreen> createState() => _PoshPolicyScreenState();
}

class _PoshPolicyScreenState extends State<PoshPolicyScreen> {
  final Set<String> _visitedItems = {};
  // Updated to 5 to match the 5 items in your code list
  final int _totalRequired = 5; 

  void _markVisited(String routeName) {
    setState(() {
      _visitedItems.add(routeName);
    });
    Navigator.pushNamed(context, routeName);
  }

  bool get _isFlowComplete => _visitedItems.length >= _totalRequired;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // Using the standard thin back arrow from the image
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Posh Policy',
          style: TextStyle(
            color: Colors.black, 
            fontWeight: FontWeight.w900, // Extra bold as per image
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Illustration matches the height and centered style
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Image.asset(
                      'assets/images/posh_home.png', // Replace with your actual asset path
                      height: 220,
                      fit: BoxFit.contain,
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Learn about our guidelines and standards for a respectful and a safe workplace.',
                          style: TextStyle(
                            color: Color(0xFF7D7D7D), 
                            fontSize: 16, 
                            height: 1.4,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 24),

                        _buildPolicyItem(context, 'Verbal Harassment', Routes.poshpolicy8),
                        _buildPolicyItem(context, 'Physical Harassment', Routes.poshpolicy9),
                        _buildPolicyItem(context, 'Visual / Digital Harassment', Routes.poshpolicy10),
                        _buildPolicyItem(context, 'Workplace Definition', Routes.poshpolicy11),
                        _buildPolicyItem(context, 'Upload Evidence', Routes.poshpolicy12),

                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Footer-style button padding
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
            child: _buildContinueButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicyItem(BuildContext context, String title, String routeName) {
    bool isDone = _visitedItems.contains(routeName);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isDone ? Colors.green : Colors.black87, 
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(18), // Match the rounded look
        boxShadow: [
          if (isDone)
            BoxShadow(
              color: Colors.green.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        title: Text(
          title, 
          style: const TextStyle(
            fontWeight: FontWeight.w800, // Matching the bold list text
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        trailing: Icon(
          isDone ? Icons.check_circle : Icons.chevron_right, 
          color: isDone ? Colors.green : Colors.black54,
          size: 26,
        ),
        onTap: () => _markVisited(routeName),
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 64, // Slightly taller for better touch target
      child: ElevatedButton(
        onPressed: _isFlowComplete ? () => Navigator.pushNamed(context, Routes.reportcompliant) : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _isFlowComplete ? Colors.black : const Color(0xFFCCCCCC),
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFFCCCCCC),
          elevation: _isFlowComplete ? 4 : 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        child: const Text(
          'Continue', 
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}