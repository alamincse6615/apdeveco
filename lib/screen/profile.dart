import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
final nameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
File? captureImage;
class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Center(
                        child: CircleAvatar(
                          maxRadius: 100,
                          child: captureImage == null
                              ? CircleAvatar(
                            maxRadius: 100,
                            backgroundImage: AssetImage("images/download.png"),
                          )
                              : CircleAvatar(
                            maxRadius: 100,
                            backgroundImage: FileImage(
                              captureImage!,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 80,
                        bottom:5,
                        child: TextButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: MediaQuery.of(context).size.height/6,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: [
                                          TextButton.icon(
                                              onPressed: () {
                                                ImageFile();
                                              },
                                              icon: Icon(Icons.browse_gallery_rounded),
                                              label:
                                              Text("Gallery")
                                          ),
                                          TextButton.icon(
                                              onPressed: () {
                                                imagecamera();
                                              },
                                              icon: Icon(Icons.camera),
                                              label:
                                              Text("Camera")
                                          ),
                                        ],
                                      ),

                                    );
                                  });
                              //  Navigator.pop(context);

                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black,
                            ),
                            label: Text("")),
                      ),
                    ],

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Enter Your Name')
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter Your Email'),
                ),
              ),
              ElevatedButton
                (
                  onPressed: () {
                    registration();
                  },
                  child: Text("Save")),
            ],
          ),
        ),
      ),
    );

  }
  imagecamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      captureImage = File(image.path);
      setState(() {});
    }
  }
  ImageFile() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      captureImage = File(image.path);
      setState(() {});
    }
  }
  registration() {
    String name = nameController.text.toString();
    String email = emailController.text.toString().trim();


    var data = {
      "Images": captureImage,
      "name": name,
      "email": email,
    };
  }
}


