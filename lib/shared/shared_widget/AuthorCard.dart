import 'package:flutter/material.dart';
import 'package:restaurant/shared/sharedThemes/themes.dart';
import 'package:restaurant/shared/shared_widget/circle_avatar.dart';

class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider imageProvider;
  const AuthorCard(
      {required this.authorName,
      required this.title,
      required this.imageProvider,
      super.key});
  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFav =false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: widget.imageProvider,
                imageRaduis: 30,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: FoodlicheTheme.LightTextTheme.headline2,
                  ),
                  Text(
                    widget.title,
                    style: FoodlicheTheme.LightTextTheme.headline3,
                  )
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(seconds: 2),
                  content: _isFav? Text(
                "${widget.title} Removed",
                textAlign: TextAlign.center,
              ):Text(
                "${widget.title} Adedd",
                textAlign: TextAlign.center,
              )));
              setState(() {
                _isFav=!_isFav;
              });
            },
            icon:_isFav? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border),
            iconSize: 30,
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }
}
