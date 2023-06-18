import 'package:dhwani/screens/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../controller/login_controller.dart';
import 'home.dart';

final controller = Get.put(LoginController());

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login ui'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Get.delete<LoginController>();
            controller.logout();
            Get.to(login());
          },
        ),
      ),
      body: Center(
        child: Center(
          child: Obx(() {
            if (controller.googleAccount.value != null) {
              return buildProfileView();
            } else {
              return buildLoginButton();
            }
          }),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class buildLoginButton extends StatelessWidget {
  const buildLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      icon: Icon(Icons.login),
      label: Text('Sign in with Google'),
      onPressed: () {
        controller.login();
      },
      //tooltip: 'Increment',
    );
  }
}

class buildProfileView extends StatelessWidget {
  const buildProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundImage:
              Image.network(controller.googleAccount.value!.photoUrl.toString())
                  .image,
          radius: 50.0,
        ),
        Text(
          'Email:${controller.googleAccount.value!.email}',
        ),
        Text(
          'name:${controller.googleAccount.value!.displayName}',
        ),
        ElevatedButton(
            onPressed: () {
              Get.to(Example());
            },
            child: Text("Go to tiles"))
      ],
    );
  }
}
