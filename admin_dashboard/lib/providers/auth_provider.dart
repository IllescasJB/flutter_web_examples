import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_services.dart';

enum AuthStatus {
  cheking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.cheking;
  Usuario? user;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    final data = {
      'correo': email,
      'password': password,
    };

    CafeApi.post('/auth/login', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      this.user = authResponse.usuario;
      LocalStorage.preferences.setString('token', authResponse.token);
      authStatus = AuthStatus.authenticated;
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      NotificationsServices.showSnackbarError('Usurio / Password no válidos');
    });
  }

  register(String email, String password, String name) {
    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
    };

    CafeApi.post('/usuarios', data).then((json) {
      print(json);
      final authResponse = AuthResponse.fromMap(json);
      this.user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      LocalStorage.preferences.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      print('error: e');
      NotificationsServices.showSnackbarError('Usurio / Password no válidos');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.preferences.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    try {
      final response = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(response);
      LocalStorage.preferences.setString('token', authResponse.token);
      this.user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.preferences.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
