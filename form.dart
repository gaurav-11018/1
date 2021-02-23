import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _username;
  String _password;
  String _area;
  String _bloodtype;
  String _age;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildUsername() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Username'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Username is Required';
        }
          return null;
      },
      onSaved: (String value) {
        _username = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildarea() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Area'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Area is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _area = value;
      },
    );
  }

  Widget _buildBloodType() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Blood Type'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'It is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _bloodtype = value;
      },
    );
  }

  Widget _buildage() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Age'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int age = int.tryParse(value);

        if (age == null || age == 17) {
          return 'Age must be greater than 17';
        }

        return null;
      },
      onSaved: (String value) {
        _age = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Demo")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildUsername(),
                _buildPassword(),
                _buildarea(),
                _buildBloodType(),
                _buildage(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    print(_name);
                    print(_username);
                    print(_bloodtype);
                    print(_area);
                    print(_password);
                    print(_age);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}