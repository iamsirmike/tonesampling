import 'package:flutter/widgets.dart';
import 'package:music_classification/model/classification_model.dart';

class ClassificationData extends ChangeNotifier {
  List<ClassificationModel> classified = [];
  void addclassification(name, classification) {
    final classify = ClassificationModel(name, classification);
    classified.add(classify);
    notifyListeners();
  }
}
