import 'package:app_cyclone/w2-d1/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameC = TextEditingController();
  TextEditingController _passwordC = TextEditingController();
  TextEditingController _repeatPasswordC = TextEditingController();

  bool _isValidEmail(value) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(title: "Form Widget", showBackButton: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text("Sign In Form",
                    style: Theme.of(context).textTheme.headline3),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _usernameC,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else if (!_isValidEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  controller: _passwordC,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  controller: _repeatPasswordC,
                  decoration: const InputDecoration(
                      labelText: 'Repeat Password',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else if (value != _passwordC.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid Data')),
                      );
                    }
                  },
                  child: const Text('Success!'),
                ),
              ],
            ),
          ),
        ));
  }
}
