import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:justthelyrics/models/bottom_menu_item.dart';

part 'bottom_menu_item_list.g.dart';

abstract class BottomMenuList
    implements Built<BottomMenuList, BottomMenuListBuilder> {
  BuiltList<BottomMenuItem>? get items;
  BottomMenuList._();
  factory BottomMenuList([void Function(BottomMenuListBuilder) updates]) =
      _$BottomMenuList;
}
