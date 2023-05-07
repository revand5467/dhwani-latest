import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/utils.dart';
import '../widgets/tile_widget.dart';
import 'login_screen.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

final String assetName = 'assets/images/bird.svg';
final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Acme Logo');

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return tileWidget(index);
        }),
      ),
      // bottomNavigationBar: ,
    );
  }
}
