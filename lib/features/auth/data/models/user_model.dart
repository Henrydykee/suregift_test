import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    @JsonKey(fromJson: _intFromAny) @Default(0) int id,
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  String get fullName {
    final parts = [firstName, lastName].where((p) => p.isNotEmpty).toList();
    return parts.isEmpty ? email : parts.join(' ');
  }

  String get initials {
    final f = firstName.isNotEmpty ? firstName[0] : '';
    final l = lastName.isNotEmpty ? lastName[0] : '';
    final combined = '$f$l'.toUpperCase();
    if (combined.isNotEmpty) return combined;
    return email.isNotEmpty ? email[0].toUpperCase() : '?';
  }
}

int _intFromAny(Object? raw) {
  if (raw is num) return raw.toInt();
  return int.tryParse(raw?.toString() ?? '') ?? 0;
}
