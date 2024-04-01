import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:malepa_redesign/users/standard/FreeTier.dart';

class RegForm extends StatefulWidget {
  const RegForm({Key? key}) : super(key: key);

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
  TextEditingController middleNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController birthRegNumberController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController passportNumberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController postalAddressController = TextEditingController();
  TextEditingController physicalAddressController = TextEditingController();
  TextEditingController centerController = TextEditingController();
  TextEditingController candidateController = TextEditingController();
  TextEditingController enrollDateController = TextEditingController();

  List<bool> genderSelection = [true, false]; // true for Boys, false for Girls

  @override
  void initState() {
    super.initState();
    // Placeholder logic for release mode and login state check
    isInReleaseMode = kReleaseMode;
    isLoggedIn = true; // Set to false for testing

    // Initialize selectedCoreSubjects with Setswana if the student type is Local
    if (studentType == 'Local' && !selectedCoreSubjects.contains('Setswana')) {
      selectedCoreSubjects.add('Setswana');
    }
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
              ExpansionTile(
                title: const Text('Student Information'),
                children: [
                  // Input fields for student information
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    controller: nameController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Surname'),
                    controller: surnameController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Middle Name'),
                    controller: middleNameController,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Date of Birth'),
                    controller: birthdayController,
                    keyboardType: TextInputType.datetime,
                    onTap: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        birthdayController.text = date.toString();
                      }
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Birth Reg Number'),
                    controller: birthRegNumberController,
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'ID Number'),
                    controller: idNumberController,
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Passport Number'),
                    controller: passportNumberController,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Gender',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  ToggleButtons(
                    children: <Widget>[
                      Text('Boys'),
                      Text('Girls'),
                    ],
                    isSelected: genderSelection,
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < genderSelection.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            genderSelection[buttonIndex] = true;
                          } else {
                            genderSelection[buttonIndex] = false;
                          }
                        }
                      });
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('Student Type'),
                children: [
                  // Radio buttons for student type
                  Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text('Local'),
                        leading: Radio(
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
                      ),
                      ListTile(
                        title: const Text('Foreigner'),
                        leading: Radio(
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
                      ),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('Core Subjects (Required)'),
                children: [
                  // Checkbox list for core subjects
                  Column(
                    children: coreSubjects.map((subject) {
                      return CheckboxListTile(
                        title: Text(subject),
                        value: selectedCoreSubjects.contains(subject),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              selectedCoreSubjects.add(subject);
                            } else {
                              selectedCoreSubjects.remove(subject);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('Optional Subjects'),
                children: [
                  // Checkbox list for optional subjects
                  Column(
                    children: optionalSubjects.map((subject) {
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
                    }).toList(),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('Contact Information'),
                children: [
                  // Input fields for contact information
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Phone/Cell Number'),
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Postal Address'),
                    controller: postalAddressController,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Physical Address'),
                    controller: physicalAddressController,
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('BEC'),
                children: [
                  // Text next to checkbox
                  Row(
                    children: [
                      const Text('Is Bocodol candidate'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Is already sitting for an exam with BEC'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Is DOSET'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  // Add more rows with text and checkboxes as needed

                  Row(
                    children: [
                      const Text('Is back to school candidate'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Previous center'),
                    controller: centerController,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Previous candidate number'),
                    controller: candidateController,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Date of registration'),
                    controller: enrollDateController,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  Row(
                    children: [
                      const Text('Is repeater candidate'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('Special needs type'),
                children: [
                  Row(
                    children: [
                      const Text('Blind'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Deaf'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Hard of hearing'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Learning difficulties'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Low vision'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Medical condition'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Other type of disability'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('Access arrangement'),
                children: [
                  Row(
                    children: [
                      const Text('Assistive Technology Devices'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Braille'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Coloured Paper'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Enlarged Print'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Extra - Time'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Modified paper - Hearing Impairment'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Oral Response'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Preferrential Sitting'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Prompter'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Reader'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Rest - Breaks'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Scribe'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Separate Room'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Other'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('Supporting Documents'),
                children: [
                  // Input fields for contact information
                  Row(
                    children: [
                      const Text('Assesment report'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Center report'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Medical report'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('ID'),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          // Checkbox logic
                        },
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Show Snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('THIS IS A DEMO!'),
                    ),
                  );
                },
                child: const Text('Verify & Proceed'),
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

void main() {
  runApp(const MaterialApp(
    home: RegForm(),
  ));
}
