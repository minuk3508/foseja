class UserEntity {
  final String uid;
  final String displayName;

  UserEntity({required this.uid, required this.displayName});

  UserEntity.empty()
      : uid = "",
        displayName = "";

  Map<String, String> toJson() {
    return {
      "uid": uid,
      "displayName": displayName,
    };
  }
}
