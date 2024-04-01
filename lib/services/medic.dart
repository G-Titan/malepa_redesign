import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:malepa_redesign/services/datapreview.dart';

class MedicHelper {
  static void verifyNproceed(
      BuildContext context, String name, String email) async {
    if (kReleaseMode) {
      // App is in release mode
      // Perform Firebase-related operations asynchronously
      await _performFirebaseOperation();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'You are not an official BEC employee, please leave/ uninstall this app'),
        ),
      );
    } else {
      // App is in debug mode BYPASS FIREBASE
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DataPreviewScreen(name: name, email: email),
        ),
      );
    }
  }

  static void artificialIntelligence(BuildContext context) {
    if (kReleaseMode) {
      // App is in release mode
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Feature under development'),
        ),
      );
    } else {
      // App is in debug mode BYPASS FIREBASE
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('AI rest mode.'),
        ),
      );
    }
  }

  static Future<void> _performFirebaseOperation() async {
    // Add your Firebase-related asynchronous operations here
    // For example:
    // await FirebaseAuth.instance.signInAnonymously();
    // await FirebaseFirestore.instance.collection('data').add({...});
  }
}
