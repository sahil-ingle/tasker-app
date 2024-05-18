import 'package:flutter/material.dart';
import 'package:tasker/auth/auth_service.dart';
import 'package:tasker/components/my_button.dart';
import 'package:tasker/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final Function()? onTap;

  LoginPage({super.key, required this.onTap});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  void login(BuildContext context) async{
    final authService = AuthService();
    
    try{
      authService.signInwithEmailPassword(_emailController.text, _pwdController.text);
    }catch (e){
      showDialog(context: context, builder: (context) =>
            AlertDialog( 
              title: Text(
                e.toString()
              )
            )
          );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wallet, size: 150,),

          const SizedBox(height: 75,),

          MyTextField(controller: _emailController, obscureText: false, hintText: "Email"),

          const SizedBox(height: 10,),

          MyTextField(controller: _pwdController, obscureText: true, hintText: "Password"),

          const SizedBox(height: 20,),

          MyButton(text: "Submit", onTap: () => login(context)),

          const SizedBox(height: 20,),

          GestureDetector(
            onTap: onTap,
            child: const Text("New here? , Register now")
            )
          
        ],
      ),
    );
  }
}