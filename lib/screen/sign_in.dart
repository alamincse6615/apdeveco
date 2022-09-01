import 'package:appdeveco/screen/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class FormPage extends StatefulWidget {
//   @override
//   _FormPageState createState() => _FormPageState();
// }
//
// class _FormPageState extends State<FormPage> {
//
//   String name;
//   String email;
//   String phone;
//
//   //TextController to read text entered in text field
//   TextEditingController password = TextEditingController();
//   TextEditingController confirmpassword = TextEditingController();
//
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formkey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       bottom: 15, left: 10, right: 10),
//                   child: TextFormField(
//                     keyboardType: TextInputType.text,
//                     decoration: buildInputDecoration(Icons.person, "Full Name"),
//
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       bottom: 15, left: 10, right: 10),
//                   child: TextFormField(
//                     keyboardType: TextInputType.text,
//                     decoration: buildInputDecoration(Icons.email, "Email"),
//
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       bottom: 15, left: 10, right: 10),
//                   child: TextFormField(
//                     keyboardType: TextInputType.number,
//                     decoration: buildInputDecoration(Icons.phone, "Phone No"),
//
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       bottom: 15, left: 10, right: 10),
//                   child: TextFormField(
//                     controller: password,
//                     keyboardType: TextInputType.text,
//                     decoration: buildInputDecoration(Icons.lock, "Password"),
//
//
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       bottom: 15, left: 10, right: 10),
//                   child: TextFormField(
//                     controller: confirmpassword,
//                     obscureText: true,
//                     keyboardType: TextInputType.text,
//                     decoration: buildInputDecoration(
//                         Icons.lock, "Confirm Password"),
//
//
//                   ),
//                 ),
//
//                 SizedBox(
//                   width: 200,
//                   height: 50,
//                   child: RaisedButton(
//                     color: Colors.redAccent,
//                     onPressed: () {
//                       if (_formkey.currentState!.validate()) {
//                         print("successful");
//
//                         return;
//                       } else {
//                         print("UnSuccessfull");
//                       }
//                     },
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50.0),
//                         side: BorderSide(color: Colors.blue, width: 2)
//                     ),
//                     textColor: Colors.white,
//                     child: Text("Submit"),
//
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   InputDecoration buildInputDecoration(IconData icons, String hinttext) {
//     return InputDecoration(
//       hintText: hinttext,
//       prefixIcon: Icon(icons),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(25.0),
//         borderSide: BorderSide(
//             color: Colors.green,
//             width: 1.5
//         ),
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(25.0),
//         borderSide: BorderSide(
//           color: Colors.blue,
//           width: 1.5,
//         ),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(25.0),
//         borderSide: BorderSide(
//           color: Colors.blue,
//           width: 1.5,
//         ),
//       ),
//     );
//   }
// }
class Sign_in extends StatefulWidget {
  const Sign_in({Key? key}) : super(key: key);

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  bool loginWithEmail = true;
  String loginWithSectedSection = "Login With ";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController registerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write your name',
                ),
              ),
            ),
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
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Your Password"),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                //controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Password Confirmation"),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: registerController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Registered by',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    registration();
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Already have an account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
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

  registration() {
    String name = nameController.text.toString();
    String phoneNumber = phoneController.text.toString();
    String email = emailController.text.toString();
    String password = passwordController.text.toString();
    String registeredBy = registerController.text.toString();

    var data = {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
      "registeredBy": registeredBy,
    };
  }
}
