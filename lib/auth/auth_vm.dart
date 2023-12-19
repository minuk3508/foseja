import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foseja/auth/auth_repo.dart';
import 'package:foseja/user/user_vm.dart';

class AuthViewModel extends AsyncNotifier<void> {
  late final AuthRepo _repo;

  @override
  FutureOr<void> build() {
    _repo = ref.read(authRepo);
  }

  Future<void> googleAuth() async {
    state = const AsyncValue.loading();
    final user = ref.read(userProvider.notifier);
    state = await AsyncValue.guard(
      () async {
        final userCredential = await _repo.signInWithGoogle();
        await user.createUser(userCredential);
      },
    );
  }

  Future<void> appleAuth() async {
    state = const AsyncValue.loading();
    final user = ref.read(userProvider.notifier);
    state = await AsyncValue.guard(
      () async {
        final userCredential = await _repo.signInWithApple();
        await user.createUser(userCredential);
      },
    );
  }
}

final authProvider = AsyncNotifierProvider<AuthViewModel, void>(
  () => AuthViewModel(),
);
