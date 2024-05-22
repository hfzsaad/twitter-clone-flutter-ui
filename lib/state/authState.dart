import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/user.dart';
import 'appState.dart';

class AuthState extends AppState {
  bool isSignInWithGoogle = false;
  late String userId;
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  UserModel? get profileUserModel => _userModel;
}
