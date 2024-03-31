import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:malepa_redesign/users/standard/FreeTier.dart';

class RegForm extends StatefulWidget {
  const RegForm({super.key});

  @override
  _RegFormState createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
  String studentType = 'Local'; // Default to local
  List<String> coreSubjects = [
    'Setswana',
    'English',
    'Math',
    'Social Studies',
    'Agriculture',
    'Moral Education',
    'Science'
  ];
  List<String> optionalSubjects = [
    'Design & technology',
    'Commerce & Office Procedures',
    'Commerce & Accounting',
    'Religious Education',
    'French',
    'Art',
    'Music',
    'Physical Education',
    'General Science',
    'Setswana'
  ];
  List<String> selectedCoreSubjects = [
    'English',
    'Math',
    'Science',
    'Social Studies',
    'Agriculture',
    'Moral Education'
  ];
  List<String> selectedOptionalSubjects = [];
  bool isInReleaseMode = false; // Placeholder for release mode check
  bool isLoggedIn = false; // Placeholder for login state check

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Placeholder logic for release mode and login state check
    isInReleaseMode = kReleaseMode;
    isLoggedIn = true; // Set to false for testing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student enrollment (manual mode)'),
        actions: <Widget>[
          // AI Mode Button
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              // Implement AI Mode functionality
              // This could include capturing information via camera and processing it
              _showFeatureUnderDevelopmentMessage();

              // to fill the form automatically
            },
          ),
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: () {
              // Placeholder for upload functionality
              // Here you might open a file picker or similar functionality
              _showFeatureUnderDevelopmentMessage();

              // This could include uploading documents or information to be processed
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Student Type',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      RadioListTile(
                        title: const Text('Local'),
                        value: 'Local',
                        groupValue: studentType,
                        onChanged: (value) {
                          setState(() {
                            studentType = value.toString();
                            // Add Setswana if not already selected
                            if (!selectedCoreSubjects.contains('Setswana')) {
                              selectedCoreSubjects.add('Setswana');
                            }
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text('Foreigner'),
                        value: 'Foreigner',
                        groupValue: studentType,
                        onChanged: (value) {
                          setState(() {
                            studentType = value.toString();
                            // Remove Setswana if selectedCoreSubjects contains it
                            if (selectedCoreSubjects.contains('Setswana')) {
                              selectedCoreSubjects.remove('Setswana');
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Core Subjects (Required)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      ...selectedCoreSubjects.map((subject) {
                        return CheckboxListTile(
                          title: Text(subject),
                          value: true,
                          onChanged: (value) {
                            // Disable core subjects checkbox
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Optional Subjects',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      ...optionalSubjects.map((subject) {
                        return CheckboxListTile(
                          title: Text(subject),
                          value: selectedOptionalSubjects.contains(subject),
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                selectedOptionalSubjects.add(subject);
                              } else {
                                selectedOptionalSubjects.remove(subject);
                              }
                            });
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Check if the app is in release mode
                  if (!isInReleaseMode) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'This feature is only available in release mode.'),
                      ),
                    );
                    return;
                  }

                  // Check if the user is logged in
                  if (!isLoggedIn) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please log in to proceed.'),
                      ),
                    );
                    return;
                  }

                  // Additional Validation Here:
                  // For demonstration, let's assume you have form keys for validating form fields
                  // Example: if (!_formKey.currentState.validate()) return;
                  // You can add your specific field checks here

                  // Verify required fields are not empty (Pseudo-code)
                  bool areFieldsFilled() {
                    return nameController.text.isNotEmpty &&
                        surnameController.text.isNotEmpty &&
                        addressController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        birthdayController.text.isNotEmpty &&
                        idNumberController.text.isNotEmpty;
                  }

                  // Verify required fields are not empty
                  if (!areFieldsFilled()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill all required fields.'),
                      ),
                    );
                    return;
                  }
                  // If all validations pass, proceed to the next stage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const FreeTier(), // The next form stage widget
                    ),
                  );
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Placeholder functionality for AI and Manual buttons
  void _showFeatureUnderDevelopmentMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("This feature is under development."),
      ),
    );
  }
}
