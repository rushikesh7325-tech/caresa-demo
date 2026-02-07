import 'package:flutter/material.dart';
import '../screens/posh/posh_home_screen.dart';
import '../screens/posh/verbal_harassment_screen.dart';
import '../screens/posh/physical_harassment_screen.dart';
import '../screens/posh/visual_digital_harassment_screen.dart';
import '../screens/posh/workplace_definition_screen.dart';
import '../screens/posh/upload_evidence_screen.dart';

class AppRoutes {
  static const poshHome = '/';
  static const verbal = '/verbal';
  static const physical = '/physical';
  static const visual = '/visual';
  static const workplace = '/workplace';
  static const upload = '/upload';

  static Map<String, WidgetBuilder> routes = {
    poshHome: (_) => const PoshHomeScreen(),
    verbal: (_) => const VerbalHarassmentScreen(),
    physical: (_) => const PhysicalHarassmentScreen(),
    visual: (_) => const VisualDigitalHarassmentScreen(),
    workplace: (_) => const WorkplaceDefinitionScreen(),
    upload: (_) => const UploadEvidenceScreen(),
  };
}
