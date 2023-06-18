import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/utils.dart';
import '../widgets/tile_widget.dart';
import 'login_screen.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

final String assetName = 'assets/images/bird.svg';
//final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Acme Logo');

bool _on = false;

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Tiles'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Get.delete<LoginController>();
            //controller.logout();
            Get.to(login());
          },
        ),
      ),
      body: 
      Container(
        child: GridView.builder(
          itemCount: 2,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0
          ),
          itemBuilder: (BuildContext context, int index) {
            return tileWidget(index,_on);
            },
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}
