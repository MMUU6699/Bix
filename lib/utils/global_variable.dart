import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:index/screens/add_post_screen.dart';
import 'package:index/screens/feed_screen.dart';
import 'package:index/screens/profile_screen.dart';
import 'package:index/screens/search_screen.dart';
import 'package:index/services/guest_service.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('notifications'),
  ProfileScreen(
    uid: GuestService.isGuestMode 
        ? GuestService.guestId 
        : FirebaseAuth.instance.currentUser!.uid,
  ),
];
