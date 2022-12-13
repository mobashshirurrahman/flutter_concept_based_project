import 'package:flutter/cupertino.dart';

class HomePageProvider with ChangeNotifier {
  bool? isEligible;
  String? eligiblityMessage = "";
  void checkEligible(int age) {
    if (age >= 18) {
      isEligible = true;
      eligiblityMessage = "You are eligible";
      notifyListeners();
    } else {
      isEligible = false;
      eligiblityMessage = "You are not eligible";
      notifyListeners();
    }
  }
}
