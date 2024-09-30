import 'package:flutter/foundation.dart';

class PageViewHolder extends ChangeNotifier{

  double value;

  PageViewHolder({required this.value});

  void setValue(newValue){
    this.value = newValue;
    notifyListeners();
  }

}