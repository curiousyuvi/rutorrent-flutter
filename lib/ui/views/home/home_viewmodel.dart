// import 'package:rutorrentflutter/app/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:rutorrentflutter/AppTheme/AppStateNotifier.dart';
import 'package:rutorrentflutter/app/app.locator.dart';
import 'package:rutorrentflutter/models/account.dart';
import 'package:rutorrentflutter/services/functional_services/authentication_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {

  AuthenticationService? _authenticationService = locator<AuthenticationService>();
  AppStateNotifier? _appStateNotifier = locator<AppStateNotifier>();

  int index = 0;
  PageController _pageController = PageController();

  Account? get account => _authenticationService!.accounts![0];
  PageController get pageController => _pageController;


  toggleTheme(bool boolVal) async {
    _appStateNotifier!.updateTheme(boolVal);
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isdarkmodeon', boolVal);
    notifyListeners();
  }

  updateIndex(index){
    this.index = index;
    notifyListeners();
  }

}