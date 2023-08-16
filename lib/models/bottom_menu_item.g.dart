// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_menu_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BottomMenuItem extends BottomMenuItem {
  @override
  final String? iconPath;
  @override
  final String? label;
  @override
  final Widget? content;

  factory _$BottomMenuItem([void Function(BottomMenuItemBuilder)? updates]) =>
      (new BottomMenuItemBuilder()..update(updates))._build();

  _$BottomMenuItem._({this.iconPath, this.label, this.content}) : super._();

  @override
  BottomMenuItem rebuild(void Function(BottomMenuItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BottomMenuItemBuilder toBuilder() =>
      new BottomMenuItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BottomMenuItem &&
        iconPath == other.iconPath &&
        label == other.label &&
        content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, iconPath.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BottomMenuItem')
          ..add('iconPath', iconPath)
          ..add('label', label)
          ..add('content', content))
        .toString();
  }
}

class BottomMenuItemBuilder
    implements Builder<BottomMenuItem, BottomMenuItemBuilder> {
  _$BottomMenuItem? _$v;

  String? _iconPath;
  String? get iconPath => _$this._iconPath;
  set iconPath(String? iconPath) => _$this._iconPath = iconPath;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  Widget? _content;
  Widget? get content => _$this._content;
  set content(Widget? content) => _$this._content = content;

  BottomMenuItemBuilder();

  BottomMenuItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _iconPath = $v.iconPath;
      _label = $v.label;
      _content = $v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BottomMenuItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BottomMenuItem;
  }

  @override
  void update(void Function(BottomMenuItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BottomMenuItem build() => _build();

  _$BottomMenuItem _build() {
    final _$result = _$v ??
        new _$BottomMenuItem._(
            iconPath: iconPath, label: label, content: content);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
