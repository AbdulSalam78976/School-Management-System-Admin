import 'package:flutter/material.dart';

class QuickAction {
  final String icon;
  final String title;
  final VoidCallback onTap;

  QuickAction({required this.icon, required this.title, required this.onTap});
}
