import 'package:flutter/material.dart';
import 'package:tros/features/personalization/controllers/listTileController.dart';
import 'package:tros/utils/constants/colors.dart';

class ProfileListDividerSeperated extends StatelessWidget {
  const ProfileListDividerSeperated({
    super.key,
  });
  // final Widget child;
  // final int itemCount;
  @override
  Widget build(BuildContext context) {
    final accountTiles = ListTileProperties(size: 19.0);

    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (_, __) {
          return const Divider(height: 1);
        },
        itemBuilder: (_, index) {
          return ListTile(
            onTap: () {},
            focusColor: PColors.grey,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            leading: accountTiles.getIcon(index),
            title: Text(accountTiles.getTitle(index),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                )),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          );
        },
        itemCount: accountTiles.getTileLength());
  }
}
