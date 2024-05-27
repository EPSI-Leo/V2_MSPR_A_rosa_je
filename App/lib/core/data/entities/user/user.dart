import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int? id,
    required String? firstName,
    required String? lastName,
    required String? email,
    required String? username,
    required String? role,
    required String? firebaseUid,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromString(String userData) {
    final cleanedData = userData.replaceAll('User(', '').replaceAll(')', '');
    final List<String> data =
        cleanedData.split(',').map((e) => e.trim()).toList();
    if (data.length != 6) {
      throw ArgumentError('Invalid user data');
    }
    return User(
      id: int.tryParse(data[0]),
      firstName: data[1].trim(),
      lastName: data[2].trim(),
      email: data[3].trim(),
      username: data[4].trim(),
      role: data[5].trim(),
      firebaseUid: data[6].trim(),
    );
  }
}
