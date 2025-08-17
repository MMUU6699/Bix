import 'package:flutter/foundation.dart';

class GuestService {
  static bool _isGuestMode = false;
  static String _guestId = '';
  
  static bool get isGuestMode => _isGuestMode;
  static String get guestId => _guestId;
  
  static void enableGuestMode() {
    _isGuestMode = true;
    _guestId = 'guest_${DateTime.now().millisecondsSinceEpoch}';
    if (kDebugMode) {
      print('Guest mode enabled with ID: $_guestId');
    }
  }
  
  static void disableGuestMode() {
    _isGuestMode = false;
    _guestId = '';
  }
  
  static Map<String, dynamic> getGuestUserData() {
    return {
      'uid': _guestId,
      'username': 'Guest User',
      'email': 'guest@example.com',
      'photoUrl': 'https://i.stack.imgur.com/l60Hf.png',
      'bio': 'Guest user browsing the app',
      'followers': [],
      'following': [],
    };
  }
}