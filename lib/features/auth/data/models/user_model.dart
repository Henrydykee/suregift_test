class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;

  const UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      email: json['email']?.toString() ?? '',
      firstName: json['firstName']?.toString() ?? '',
      lastName: json['lastName']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
      };
}

