import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:tros/utils/constants/colors.dart';

class ListTileProperties {
  ListTileProperties({required this.size});
  double size = 18;
  final auth = AuthenticationRepository.instance;
  List listTileWidget(size) {
    return [
      {
        'title': 'Edit Profile',
        'leading': Icon(Iconsax.user_edit_bold, size: size),
        'route': '/profile',
        'onTap': () {}
      },
      {
        'title': 'My Notifications',
        'leading': Icon(Iconsax.notification_1_bold, size: size),
        'route': '/notification',
        'onTap': () {}
      },
      {
        'title': 'Frequently Asked Questions',
        'leading': Icon(Iconsax.message_question_bold, size: size),
        'route': '/frequently',
        'onTap': () {}
      },
      {
        'title': 'Contact Us',
        'leading': Icon(Iconsax.headphone_bold, size: size),
        'route': '/language',
        'onTap': () {}
      },
      {
        'title': 'App Settings',
        'leading': Icon(Iconsax.setting_2_bold, size: size),
        'route': '/settings',
        'onTap': () {}
      },
      // {
      //   'title': 'Feedback & Help',
      //   'leading': Icon(Icons.headphones_outlined, size: size),
      //   'route': '/feedback'
      // },
      {
        'title': 'Sign Out',
        'leading': Icon(
          Iconsax.logout_1_bold,
          size: size,
          color: PColors.error,
        ),
        // 'onTap':()=>auth.signOut();
      },
    ];
  }

  int getTileLength() => listTileWidget(size).length;
  List getTileList() => listTileWidget(size);
  String getTitle(index) => listTileWidget(size)[index]['title'];
  Widget getIcon(index) => listTileWidget(size)[index]['leading'];
  String getRoute(index) => listTileWidget(size)[index]['route'];
}
