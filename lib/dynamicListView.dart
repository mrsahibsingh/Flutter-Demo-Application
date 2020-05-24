import 'package:flutter/cupertino.dart';

class DynamicListView {
  final String _name;
  final Widget _link;

  DynamicListView(this._name, this._link);

  Widget get link => _link;

  String get name => _name;
}
