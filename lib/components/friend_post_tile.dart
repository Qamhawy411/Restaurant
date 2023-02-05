import 'package:flutter/material.dart';
import 'package:restaurant/models/post.dart';
import 'package:restaurant/shared/shared_widget/circle_avatar.dart';

class FriendPostTile extends StatelessWidget {
  final Post post;
  const FriendPostTile({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleImage(
          imageProvider: AssetImage(post.profileImageUrl),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.comment),
            Text(
              "${post.timestamp} mins ago",
              style: const TextStyle(fontWeight: FontWeight.w700),
            )
          ],
        ))
      ],
    );
  }
}
