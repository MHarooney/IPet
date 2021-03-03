import 'package:flutter/material.dart';
import 'package:ipet/domain/repository/api_repository.dart';
import 'package:ipet/domain/repository/local_storage_repository.dart';

class ProfileBLoC extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  ProfileBLoC({
    this.localRepositoryInterface,
    this.apiRepositoryInterface,
  });

  bool isDark = false;
  final switchNotifier = ValueNotifier<bool>(false);

  void loadTheme() async {
    isDark = await localRepositoryInterface.isDarkMode() ?? false;
    switchNotifier.value = isDark;
    notifyListeners();
  }

  void updateTheme(bool isDarkValue) {
    localRepositoryInterface.saveDarkMode(isDarkValue);
    isDark = isDarkValue;
    //notifyListeners();
    switchNotifier.value = isDark;
  }

  Future<void> logOut() async {
    final token = await localRepositoryInterface.getToken();
    await apiRepositoryInterface.logout(token);
    await localRepositoryInterface.clearAllData();
  }
}
