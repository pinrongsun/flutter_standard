import 'package:flutter/material.dart';
import 'package:flutter_product/utils/localization/app_translations.dart';
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
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 35, right: 35),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: Constants.fontSizes.display1),
                            ),
                            padding: EdgeInsets.only(bottom: 50),
                          ),
                          _buildSocialLogin(),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              '- OR -',
                              style: TextStyle(
                                  fontSize: Constants.fontSizes.subtitle),
                            ),
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            elevation: 1.6,
                            shadowColor: Colors.black38,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5, right: 15, left: 15),
                                    child: _buildEmailTextField()),
                                Divider(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 15, left: 15),
                                  child: _buildPasswordTextField(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: _buildRememberMe(),
                          ),
                          _authMode == AuthMode.SignUp
                              ? _buildPasswordConfirmTextField()
                              : Container(),
                          // _buildAcceptSwitch(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: _buildLoginFooter(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: ScopedModelDescendant<MainScopedModel>(
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
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLogin() => Column(
        children: <Widget>[
          Text(
            "Sign In with your social account",
            style: TextStyle(fontSize: Constants.fontSizes.title),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Material(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              elevation: 1.6,
              shadowColor: Colors.black38,
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () => null,
                    borderRadius: BorderRadius.circular(5),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: {
                          0: FractionColumnWidth(.15),
                          1: FractionColumnWidth(.15),
                          3: FractionColumnWidth(.15),
                        },
                        children: [
                          TableRow(
                            children: [
                              Container(),
                              Image(
                                height: 30,
                                image: AssetImage(Constants.images.facebook),
                              ),
                              Text(
                                'Sign In with Facebook',
                                style: TextStyle(
                                    fontSize: Constants.fontSizes.subtitle),
                              ),
                              Container(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(height: 1),
                  InkWell(
                    onTap: () => null,
                    borderRadius: BorderRadius.circular(5),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: {
                          0: FractionColumnWidth(.15),
                          1: FractionColumnWidth(.15),
                          3: FractionColumnWidth(.15),
                        },
                        children: [
                          TableRow(
                            children: [
                              Container(),
                              Image(
                                height: 30,
                                image: AssetImage(Constants.images.google),
                              ),
                              Text(
                                'Sign In with Google',
                                style: TextStyle(
                                    fontSize: Constants.fontSizes.subtitle),
                              ),
                              Container(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget loginHeader() => Container(
        // margin: new EdgeInsets.only(top: 70.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            // AppIcon(),
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
        ),
      );
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: TextFormField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
                labelStyle: TextStyle(color: Colors.black),
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
  }

  Widget _buildPasswordTextField() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Expanded(
            child: TextFormField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
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

  Widget _buildRememberMe() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: true,
                  onChanged: null,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Text('Remember me'),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text('Forgot password'),
          ),
        ],
      );

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

  Widget _buildLoginFooter(context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _authMode == AuthMode.Login
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("If you don't have an account ? "),
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
                  )
                : Row(
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
