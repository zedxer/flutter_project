import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart'; // You need to add this dependency to your pubspec.yaml file

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // A key to identify the form
  final _emailController = TextEditingController(); // A controller to get the email input
  bool _autoValidate = false; // A flag to enable auto validation

  @override
  void dispose() {
    _emailController.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled, // Set the auto validate mode based on the flag
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                EmailValidator.validate(value!) // Use the email validator package to validate the input
                    ? null
                    : 'Please enter a valid email', // Return null if valid, or an error message if not
              ),
              const SizedBox(height: 16), // A spacer widget for some vertical space
              ElevatedButton(
                onPressed: _submit, // Call the submit function when pressed
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) { // Check if the form is valid
// If yes, navigate to the home screen and clear the email field
      Navigator.pushNamed(context, '/a');
      _emailController.clear();
    } else {
// If not, enable auto validation and show a snackbar
      setState(() {
        _autoValidate = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email'),
        ),
      );
    }
  }
}
