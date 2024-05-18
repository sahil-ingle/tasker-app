import 'package:flutter/material.dart';
import 'package:tasker/pages/login_page.dart';
import 'package:tasker/pages/register_page.dart';

class RegisterORLogin extends StatefulWidget {
  const RegisterORLogin({super.key});

  @override
  State<RegisterORLogin> createState() => _RegisterORLoginState();
}

class _RegisterORLoginState extends State<RegisterORLogin> {

bool isLoginPage = true;


void toggle(){
  setState(() {
    isLoginPage = !isLoginPage;
  });
  
}

  @override
  Widget build(BuildContext context) {
    if(!isLoginPage){
      return LoginPage(onTap: toggle,);
    }else{
      return RegisterPage(onTap: toggle,);
    }
  }
}