class AppLoginModel {
  final String token;
  final UserModel user;

  AppLoginModel({
    required this.token,
    required this.user,
  });

  factory AppLoginModel.fromJson(Map<String, dynamic> json) {
    return AppLoginModel(
      token: json['token'],
      user: UserModel.fromJson(json['user']),
    );
  }
}


class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String hireDate;
  final String bankAccount;
  final String ssin;
  final String nationalIdPhoto;
  final String contractImage;
  final String profileImage;
  final int departmentId;
  final int roleId;
  final int salaryId;
  final int positionId;
  final String createdAt;
  final String updatedAt;
  final String? emailVerifiedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.hireDate,
    required this.bankAccount,
    required this.ssin,
    required this.nationalIdPhoto,
    required this.contractImage,
    required this.profileImage,
    required this.departmentId,
    required this.roleId,
    required this.salaryId,
    required this.positionId,
    required this.createdAt,
    required this.updatedAt,
    this.emailVerifiedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      hireDate: json['hire_date'],
      bankAccount: json['bank_account'],
      ssin: json['ssin'],
      nationalIdPhoto: json['national_id_photo'],
      contractImage: json['contract_image'],
      profileImage: json['profile_image'],
      departmentId: json['department_id'],
      roleId: json['role_id'],
      salaryId: json['salary_id'],
      positionId: json['position_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      emailVerifiedAt: json['email_verified_at'],
    );
  }
}

