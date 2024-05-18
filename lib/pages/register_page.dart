import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasker/auth/auth_service.dart';
import 'package:tasker/components/my_button.dart';
import 'package:tasker/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _pwdConfirmController = TextEditingController();

  void register(BuildContext context) async{
    final authService = AuthService();

    if (_pwdController.text == _pwdConfirmController.text){
      try {
      authService.signUpwithEmailPassword(_emailController.text, _pwdController.text);
    }catch (e){
      showDialog(context: context, builder: (context) =>
            AlertDialog( 
              title: Text(
                e.toString()
              )
            )
          );
      }
    }else{
      showDialog(context: context, builder: (context) =>
            const AlertDialog( 
              title: Text(
                "Password doesnt match"
              )
            )
          );
      
    }
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Icon(Icons.wallet, size: 150,),
          
              const SizedBox(height: 75,),
          
              MyTextField(controller: _emailController, obscureText: false, hintText: "Email"),
          
              const SizedBox(height: 10,),
          
              MyTextField(controller: _pwdController, obscureText: true, hintText: "Password"),
          
              const SizedBox(height: 10,),
          
              MyTextField(controller: _pwdConfirmController, obscureText: true, hintText: "Confirm Password"),
          
              const SizedBox(height: 20,),
          
              MyButton(text: "Submit", onTap: () => register(context)),
          
              const SizedBox(height: 20,),
          
              GestureDetector(
                onTap: onTap,
                child: const Text("New here? , Register now"))
          ],),
        ),
      )
    );
  }
}