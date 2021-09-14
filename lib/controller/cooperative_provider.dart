import 'package:fa_fa/models/cooperative.dart';
import 'package:flutter/cupertino.dart';

class AllCooperativeProvider with ChangeNotifier {
  bool _isProcessing = true;
  List<AllCooperativeData> _listCooperatives = [];

  bool get isProcessing => _isProcessing;
  List<AllCooperativeData> get listCooperatives {
    return [..._listCooperatives];
  }

  setcooPerativeListe(List<AllCooperativeData> list) {
    _listCooperatives = list;
    notifyListeners();
  }
}
