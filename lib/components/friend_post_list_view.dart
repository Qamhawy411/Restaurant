import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant/components/friend_post_tile.dart';
import 'package:restaurant/models/post.dart';

class friend_post_list_view extends StatelessWidget {
  final List<Post> friendPosts;
  const friend_post_list_view({super.key, required this.friendPosts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),
      // 3
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 4
          Text('Sugessted  Chefs 👨‍🍳 ',
              style: Theme.of(context).textTheme.headline1),
          // 5
          const SizedBox(height: 16),
          ListView.separated(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return FriendPostTile(
                  post: friendPosts[index],
                );
              }),
              separatorBuilder: ((context, index) {
                return SizedBox(
                  height: 16,
                );
              }),
              itemCount: friendPosts.length),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
