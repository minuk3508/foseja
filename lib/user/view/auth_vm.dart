import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foseja/auth/repo/auth_repo.dart';

class AuthViewModel extends AsyncNotifier<void> {
  late final AuthRepo _repo;

  @override
  FutureOr<void> build() {
    _repo = ref.read(authRepo);
  }

  Future<void> googleAuth() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _repo.signInWithGoogle(),
    );
  }
}

final authProvider = AsyncNotifierProvider<AuthViewModel, void>(
  () => AuthViewModel(),
);
