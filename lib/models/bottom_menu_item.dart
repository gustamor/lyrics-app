import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;

part 'bottom_menu_item.g.dart';

abstract class BottomMenuItem
    implements Built<BottomMenuItem, BottomMenuItemBuilder> {
  String? get iconPath;
  String? get label;
  Widget? get content;

  BottomMenuItem._();
  factory BottomMenuItem([void Function(BottomMenuItemBuilder) updates]) =
      _$BottomMenuItem;
}
