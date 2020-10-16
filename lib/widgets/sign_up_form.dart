import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/auth_input_decor.dart';
import 'package:instagram_clone/constants/common_size.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/widgets/or_divider.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _cpwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              SizedBox(
                height: common_l_gap,
              ),
              Image.asset('assets/images/insta_text_logo.png'),
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.black54,
                decoration: textInputDecor('Email'),
                validator: (text) {
                  if (text.isNotEmpty && text.contains('@'))
                    return null;
                  else
                    return '정확한 이메일 주소를 입력해주세요';
                },
              ),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                controller: _pwController,
                cursorColor: Colors.black54,
                obscureText: true,
                decoration: textInputDecor('Password'),
                validator: (text) {
                  if (text.isNotEmpty && text.length > 5)
                    return null;
                  else
                    return '제대로 된 비밀번호를 입력해주세요';
                },
              ),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                controller: _cpwController,
                cursorColor: Colors.black54,
                obscureText: true,
                decoration: textInputDecor('Confirm Password'),
                validator: (text) {
                  if (text.isNotEmpty && _pwController.text == text)
                    return null;
                  else
                    return '입력한 비밀번호가 일치하지 않습니다';
                },
              ),
              SizedBox(
                height: common_s_gap,
              ),
              _submitButton(context),
              SizedBox(
                height: common_s_gap,
              ),
              OrDivider(),
              FlatButton.icon(
                  onPressed: () {},
                  textColor: Colors.blue,
                  icon: ImageIcon(AssetImage('assets/images/facebook.png')),
                  label: Text('Login with Facebook')),
            ],
          ),
        ),
      ),
    );
  }

  FlatButton _submitButton(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      onPressed: () {
        if (_formkey.currentState.validate()) {
          print('Validation Success');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        }
      },
      child: Text(
        'Join',
        style: TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    );
  }
}
