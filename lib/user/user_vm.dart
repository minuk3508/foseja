import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:foseja/auth/auth_repo.dart';
import 'package:foseja/user/user_entity.dart';
import 'package:foseja/user/user_repo.dart';

class UserViewModel extends AsyncNotifier<UserEntity> {
  late final UserRepo _userRepo;
  //late final AuthRepo _authRepo;

  @override
  FutureOr<UserEntity> build() {
    _userRepo = ref.read(userRepo);
    // _authRepo = ref.read(authRepo);
    return UserEntity.empty();
  }

  Future<void> createUser(UserCredential credential) async {
    if (credential.user == null) {
      throw Exception('계정생성에 실패했습니다. - credential is null');
    }
    state = const AsyncValue.loading();
    final user = UserEntity(
      uid: credential.user!.uid,
      displayName: credential.user!.displayName ?? "anonymous",
    );

    await _userRepo.createUser(user);

    state = AsyncData(user);
  }
}

final userProvider =
    AsyncNotifierProvider<UserViewModel, UserEntity>(() => UserViewModel());
