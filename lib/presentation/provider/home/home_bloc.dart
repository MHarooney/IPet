import 'package:flutter/material.dart';
import 'package:ipet/domain/model/user.dart';
import 'package:ipet/domain/repository/api_repository.dart';
import 'package:ipet/domain/repository/local_storage_repository.dart';

class HomeBLoC extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  HomeBLoC({
    this.localRepositoryInterface,
    this.apiRepositoryInterface,
  });

  User user;
  int indexSelected = 0;

  Future<void> loadUser() async {
    user = await localRepositoryInterface.getUser();
    notifyListeners();
  }

  void updateIndexSelected(int index) {
    indexSelected = index;
    notifyListeners();
  }
}
