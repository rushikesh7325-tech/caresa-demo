import 'package:flutter/material.dart';

class ComplaintStepper extends StatelessWidget {
  final String currentStatus;

  const ComplaintStepper({super.key, required this.currentStatus});

  final steps = const [
    'submitted',
    'review',
    'investigation',
    'resolved',
  ];

  @override
  Widget build(BuildContext context) {
    // Determine the current progress index
    final currentStepIndex = steps.indexOf(currentStatus);

    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final isCompleted = index < currentStepIndex;
        final isActive = index == currentStepIndex;
        final isLast = index == steps.length - 1;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Left Column: Icons and Connector Lines
              Column(
                children: [
                  _buildIcon(index, isCompleted, isActive),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 3.5, // Thicker line as seen in images
                        color: isCompleted ? Colors.black : Colors.grey.shade300,
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 20),
              // Right Column: Label Text
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0), // Spacing between steps
                child: Text(
                  _label(step),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: (isActive || isCompleted) 
                        ? FontWeight.w800 
                        : FontWeight.w500,
                    color: (isActive || isCompleted) 
                        ? Colors.black 
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildIcon(int index, bool isCompleted, bool isActive) {
    if (isCompleted) {
      return const Icon(Icons.check_circle, color: Colors.black, size: 28);
    }

    if (isActive) {
      // Customizing icons based on the specific active step from your screenshots
      switch (steps[index]) {
        case 'review':
          return const Icon(Icons.access_time_filled, color: Colors.black, size: 28);
        case 'investigation':
          return const Icon(Icons.published_with_changes, color: Colors.black, size: 28);
        case 'resolved':
          return const Icon(Icons.task_alt, color: Colors.black, size: 28);
        default:
          return const Icon(Icons.radio_button_checked, color: Colors.black, size: 28);
      }
    }

    // Default/Pending State
    return Icon(
      Icons.radio_button_unchecked, 
      color: Colors.grey.shade300, 
      size: 28
    );
  }

  String _label(String step) {
    switch (step) {
      case 'submitted':
        return 'Report Submitted';
      case 'review':
        return 'Under Review by IC';
      case 'investigation':
        return 'Investigation In Progress';
      case 'resolved':
        return 'Resolution & Outcome';
      default:
        return '';
    }
  }
}