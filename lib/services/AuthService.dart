import 'package:flutter/material.dart';
import '../supanova.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:malepa_redesign/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// Import Firebase core

class AuthService {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> initializeFirebaseAndShowLogin(BuildContext context,
      {bool debugMode = false}) async {
    // Check for internet connectivity
    bool hasInternet = await isInternetAvailable();
    if (hasInternet || debugMode) {
      try {
        // Initialize Firebase
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        // Proper Firebase initialization
        print('Firebase initialized');

        // Show the login dialog
        _showLoginDialog(context);
      } catch (e) {
        print('Error initializing Firebase: $e');
        // Handle Firebase initialization error
        _offlineDialog(context);
      }
    } else {
      // Handle the case where there's no internet and not in debug mode
      _offlineDialog(
          context); // Modified to show offline dialog in case of no internet
    }
  }

  Future<bool> isInternetAvailable() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  void _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Malepa Login'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _login(context);
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  void _offlineDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Offline Mode'),
        content: const Text(
            'You are currently offline. This is a premium mode for just P700/pm'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _login(BuildContext context) async {
    String email = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog(context, "Please enter both email and password");
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to the next screen after successful login
      Navigator.pushReplacement(
        // Use pushReplacement to replace the current route
        context,
        MaterialPageRoute(builder: (context) => const SupaNova()),
      );

      print('Signed in as: ${userCredential.user?.email}');
    } catch (e) {
      // Handle specific error for incorrect password
      if (e is FirebaseAuthException) {
        _showErrorDialog(context, e.code);
      } else {
        // Handle other errors
        _showErrorDialog(context, "An error occurred. Please try again.");
      }
    }
  }

  void _showErrorDialog(BuildContext context, String errorCode) {
    String errorMessage =
        "Check your login information or internet connection. Something drastically went wrong😔";

    switch (errorCode) {
      case "invalid-email":
        errorMessage = "Invalid email address.";
        break;
      case "user-not-found":
        errorMessage = "User not found. Please check your credentials.";
        break;
      case "invalid-password":
        errorMessage = "Password is wrong. Please try again.";
        break;
      case "user-not-found":
        errorMessage = "Your account has been disabled.";
        break;
      case "too-many-requests":
        errorMessage = "Too many login attempts. Please try again later.";
        break;
      case "operation-not-allowed":
        errorMessage =
            "Email/password sign-in is not enabled for this project.";
        break;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Oopsie!'),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Check if the widget is mounted before accessing the context
      if (Navigator.canPop(context)) {
        // Navigate back to the home screen (assuming its route name is '/home')
        Navigator.popUntil(context, ModalRoute.withName('/main'));
      }
      print('Logged out successfully');
    } catch (error) {
      // Handle any errors that occur during logout
      print('Error logging out: $error');
      rethrow; // Re-throw the error to be caught by the caller
    }
  }
}
