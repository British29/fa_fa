import 'package:fa_fa/models/membres.dart';
import 'package:flutter/cupertino.dart';

class MembreDataProvider with ChangeNotifier {
  bool _isProcessing = true;
  List<MembreData> _listMembres = [];

  bool get isProcessing => _isProcessing;
  List<MembreData> get listMembres {
    return [..._listMembres];
  }

  setcooPerativeListe(List<MembreData> list) {
    _listMembres = list;
    notifyListeners();
  }
}
