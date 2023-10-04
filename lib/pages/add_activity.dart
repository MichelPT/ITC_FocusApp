import 'package:flutter/material.dart';
import 'package:focus_app/model/focus_activity.dart';

class AddAct extends StatefulWidget {
  const AddAct({super.key});

  @override
  State<AddAct> createState() => _AddActState();
}

class _AddActState extends State<AddAct> {
  final _formKey = GlobalKey<FormState>();

  var _enteredTitle = '';

  var _enteredDescription = '';

  void _saveActivity(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(FocusActivity(
          title: _enteredTitle, description: _enteredDescription));
    }
  }

  void _resetActivity() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (newValue) {
                    _enteredTitle = newValue!;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 20) {
                      return 'Diisi yaa';
                    }
                    return null;
                  },
                  maxLength: 20,
                  decoration: const InputDecoration(label: Text('Title')),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    _enteredDescription = newValue!;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 20) {
                      return 'Diisi yaa';
                    }
                    return null;
                  },
                  maxLength: 40,
                  decoration: const InputDecoration(label: Text('Description')),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: _resetActivity, child: Text('Reset')),
                    ElevatedButton(
                        onPressed: () {
                          _saveActivity(context);
                        },
                        child: const Text('Save'))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
