// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_menu_item_list.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BottomMenuList extends BottomMenuList {
  @override
  final BuiltList<BottomMenuItem>? items;

  factory _$BottomMenuList([void Function(BottomMenuListBuilder)? updates]) =>
      (new BottomMenuListBuilder()..update(updates))._build();

  _$BottomMenuList._({this.items}) : super._();

  @override
  BottomMenuList rebuild(void Function(BottomMenuListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BottomMenuListBuilder toBuilder() =>
      new BottomMenuListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BottomMenuList && items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BottomMenuList')..add('items', items))
        .toString();
  }
}

class BottomMenuListBuilder
    implements Builder<BottomMenuList, BottomMenuListBuilder> {
  _$BottomMenuList? _$v;

  ListBuilder<BottomMenuItem>? _items;
  ListBuilder<BottomMenuItem> get items =>
      _$this._items ??= new ListBuilder<BottomMenuItem>();
  set items(ListBuilder<BottomMenuItem>? items) => _$this._items = items;

  BottomMenuListBuilder();

  BottomMenuListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BottomMenuList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BottomMenuList;
  }

  @override
  void update(void Function(BottomMenuListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BottomMenuList build() => _build();

  _$BottomMenuList _build() {
    _$BottomMenuList _$result;
    try {
      _$result = _$v ?? new _$BottomMenuList._(items: _items?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BottomMenuList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
