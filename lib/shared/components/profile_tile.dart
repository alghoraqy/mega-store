import 'package:flutter/material.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/responsive.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String trail;
  final VoidCallback onpressed;
  const ProfileTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.trail,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpressed,
      leading: Icon(
        icon,
        size: 35,
        color: AppColors.brown,
      ),
      title: Text(
        title,
        style: AppTextStyle.profile.copyWith(fontSize: 15),
      ),
      dense: true,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: rwidth(context) / 4,
            child: Text(
              trail,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.details.copyWith(fontSize: 12),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 15,
          )
        ],
      ),
    );
  }
}
