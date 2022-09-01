import 'package:appdeveco/screen/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginWithEmail = true;
  String loginWithSectedSection = "Login With ";
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: loginWithEmail ? emailSection() : phoneSection(),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  loginProviderToggle();
                },
                child: Text(
                  loginWithSectedSection +
                      (loginWithEmail ? "Phone Number" : "Email"),
                  textAlign: TextAlign.center,
                ),
              ),
              alignment: Alignment.topRight,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Your Password"),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility)),
              ),
            ),
            Singup()
            
          ],
        ),
      ),
    );
  }

  Widget emailSection() {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text("Enter Your Email"),
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

  Widget phoneSection() {
    return TextField(
      controller: phoneController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text("Enter Your Phone"),
        prefixIcon: Icon(Icons.phone),
      ),
    );
  }

  loginProviderToggle() {
    if (loginWithEmail)
      loginWithEmail = false;
    else
      loginWithEmail = true;
    setState(() {});
  }
 Widget Singup (){
    return Container(
      child: ElevatedButton.icon(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_in ()));
      }, icon: Icon(Icons.create) , label: Text("Sing Up")),
    );
 }
}
