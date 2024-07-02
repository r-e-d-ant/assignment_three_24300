import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isSignIn = true;
  final _formKey = GlobalKey<FormState>();
  
  // Controllers for capturing user input
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }

  void _toggleAuthMode() {
    setState(() {
      _isSignIn = !_isSignIn;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      if (_isSignIn) {
        _signIn();
      } else {
        _signUp();
      }
    }
  }

  void _signIn() {
    // Logic for signing in (e.g., calling the auth service)
    print('Sign In with Email: ${_emailController.text}, Password: ${_passwordController.text}');
  }

  void _signUp() {
    // Logic for signing up (e.g., calling the auth service)
    print('Sign Up with:');
    print('First Name: ${_firstNameController.text}');
    print('Last Name: ${_lastNameController.text}');
    print('Email: ${_emailController.text}');
    print('Phone: ${_phoneController.text}');
    print('Birthdate: ${_birthdateController.text}');
    print('Password: ${_passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSignIn ? 'Sign In' : 'Sign Up'),
        actions: [
          TextButton(
            onPressed: _toggleAuthMode,
            child: Text(
              _isSignIn ? 'Switch to Sign Up' : 'Switch to Sign In',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              if (!_isSignIn) ...[
                // Fields specific to Sign Up
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _birthdateController,
                  decoration: InputDecoration(labelText: 'Birthdate (YYYY-MM-DD)'),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your birthdate';
                    }
                    return null;
                  },
                ),
              ],
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(_isSignIn ? 'Sign In' : 'Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
