import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/utils/constants/colors.dart';

class ListTileProperties {
  ListTileProperties({required this.size});
  double size = 18;
  List listTileWidget(size) {
    return [
      {
        'title': 'Edit Profile',
        'leading': Icon(Iconsax.user_edit_bold, size: size),
        'route': '/profile'
      },
      {
        'title': 'My Notifications',
        'leading': Icon(Iconsax.notification_1_bold, size: size),
        'route': '/notification'
      },
      {
        'title': 'Frequently Asked Questions',
        'leading': Icon(Iconsax.message_question_bold, size: size),
        'route': '/frequently'
      },
      {
        'title': 'Contact Us',
        'leading': Icon(Iconsax.headphone_bold, size: size),
        'route': '/language'
      },
      {
        'title': 'App Settings',
        'leading': Icon(Iconsax.setting_2_bold, size: size),
        'route': '/settings'
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
        'route': '/referral'
      },
    ];
  }

  int getTileLength() => listTileWidget(size).length;
  List getTileList() => listTileWidget(size);
  String getTitle(index) => listTileWidget(size)[index]['title'];
  Widget getIcon(index) => listTileWidget(size)[index]['leading'];
  String getRoute(index) => listTileWidget(size)[index]['route'];
}
