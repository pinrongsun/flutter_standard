import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/icon_font.dart';
import '../widgets/app_icon.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/main.dart';
import '../models/auth.dart';
import '../widgets/gradient_button.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  AuthMode _authMode = AuthMode.Login;

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
      image: AssetImage('assets/images/background.jpg'),
    );
  }

  Widget _buildEmailTextField() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.grey, width: 0.7, style: BorderStyle.solid),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Expanded(
            child: TextFormField(
              textAlign: TextAlign.left,
              style: TextStyle(color: Constants.colors.primary),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
                labelStyle: TextStyle(color: Constants.colors.primary),
                icon: Icon(
                  FeatherIcons.mail,
                  size: 20.0,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (String value) {
                if (value.isEmpty ||
                    !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
              },
              onSaved: (String value) {
                _formData['email'] = value;
              },
            ),
          ),
        ],
      ),
    );

    /*
    TextFormField(
      decoration: InputDecoration(
          labelText: 'E-Mail', filled: true, fillColor: Colors.white),

    );*/
  }

  Widget _buildPasswordTextField() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.grey, width: 0.7, style: BorderStyle.solid),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Expanded(
            child: TextFormField(
              style: TextStyle(color: Constants.colors.primary),
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
                icon: Icon(
                  FeatherIcons.lock,
                  size: 20.0,
                ),
              ),
              obscureText: true,
              controller: _passwordTextController,
              validator: (String value) {
                if (value.isEmpty || value.length < 6) {
                  return 'Password invalid';
                }
              },
              onSaved: (String value) {
                _formData['password'] = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordConfirmTextField() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.grey, width: 0.7, style: BorderStyle.solid),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Expanded(
            child: TextFormField(
              style: TextStyle(color: Constants.colors.primary),
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Confirm Password',
                icon: Icon(
                  FeatherIcons.lock,
                  size: 20.0,
                ),
              ),
              obscureText: true,
              validator: (String value) {
                if (_passwordTextController.text != value) {
                  return 'Passwords do not match.';
                }
              },
              onSaved: (String value) {
                _formData['password'] = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      activeColor: Constants.colors.primary,
      value: _formData['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  void _submitForm(Function authenticate) async {
    if (!_formKey.currentState.validate() || !_formData['acceptTerms']) {
      return;
    }
    _formKey.currentState.save();
    Map<String, dynamic> successInformation;
    successInformation = await authenticate(
        _formData['email'], _formData['password'], _authMode);
    if (successInformation['success']) {
      // Navigator.pushReplacementNamed(context, '/');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('An Error Occurred!'),
            content: Text(successInformation['message']),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: _buildBackgroundImage(),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      loginHeader(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildEmailTextField(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildPasswordTextField(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _authMode == AuthMode.SignUp
                          ? _buildPasswordConfirmTextField()
                          : Container(),
                      _buildAcceptSwitch(),
                      SizedBox(
                        height: 20.0,
                      ),
                      ScopedModelDescendant<MainScopedModel>(
                        builder: (BuildContext context, Widget child,
                            MainScopedModel model) {
                          return model.isLoading
                              ? CircularProgressIndicator()
                              : Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 0.0,
                                  ),
                                  width: double.infinity,
                                  child: GradientButton(
                                    onPressed: () {
                                      _submitForm(model.authenticate);
                                    },
                                    text: _authMode == AuthMode.Login
                                        ? 'Sign In'
                                        : 'Sign Up',
                                  ),
                                );

                          /*RaisedButton(
                                  textColor: Colors.white,
                                  child: Text(_authMode == AuthMode.Login
                                      ? 'LOGIN'
                                      : 'SIGNUP'),
                                  onPressed: () =>
                                      _submitForm(model.authenticate),
                                );*/
                        },
                      ),
                      loginFooter(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginHeader() => Container(
          // margin: new EdgeInsets.only(top: 70.0),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          AppIcon(),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Welcome to ${Constants.appName}",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Constants.colors.primary,
                fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Sign in to access your account.",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ));

  loginFooter(context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30.0),
            new GestureDetector(
              onTap: () {
                //  Navigator.pushNamed(context, Routes.resetPassword);
              },
              child: new Text(
                "Forgot Password?",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10.0),
            _authMode == AuthMode.Login ?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account? "),
                new GestureDetector(
                  onTap: () {
                    setState(() {
                      _authMode = _authMode == AuthMode.Login
                          ? AuthMode.SignUp
                          : AuthMode.Login;
                    });
                  },
                  child: new Text(" Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Constants.colors.primary)),
                ),
              ],
            ):
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account? "),
                new GestureDetector(
                  onTap: () {
                    setState(() {
                      _authMode = _authMode == AuthMode.Login
                          ? AuthMode.SignUp
                          : AuthMode.Login;
                    });
                  },
                  child: new Text(" Sign In",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Constants.colors.primary)),
                ),
              ],
            ),
            SizedBox(
            height: 10.0,
            ),
          ],
        ),
      );
}
