import 'package:flutter/widgets.dart';
import 'package:index/models/user.dart';
import 'package:index/resources/auth_methods.dart';
import 'package:index/services/guest_service.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user;
    if (GuestService.isGuestMode) {
      final guestData = GuestService.getGuestUserData();
      user = User(
        username: guestData['username'],
        uid: guestData['uid'],
        photoUrl: guestData['photoUrl'],
        email: guestData['email'],
        bio: guestData['bio'],
        followers: guestData['followers'],
        following: guestData['following'],
      );
    } else {
      user = await _authMethods.getUserDetails();
    }
    _user = user;
    notifyListeners();
  }
}