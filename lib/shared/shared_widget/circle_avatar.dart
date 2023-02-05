
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double imageRaduis;
  final ImageProvider ? imageProvider;
  const CircleImage({ this.imageRaduis=20, required this.imageProvider ,super.key});

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
        backgroundColor: Colors.white,
         radius: imageRaduis ,
         child: CircleAvatar(
          radius:imageRaduis-5 ,
          backgroundImage:imageProvider ,
         ),
    );
  }
}