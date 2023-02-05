 import 'package:flutter/material.dart';

abstract class NavigationStates {}

class NavigationMove extends NavigationStates{
  int index;
  Widget screen;
  NavigationMove(this.index,this.screen);
}

