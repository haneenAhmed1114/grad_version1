class EmployeeResponse {
  final bool success;
  final List<EmployeeData> data;

  EmployeeResponse({required this.success, required this.data});

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) {
    return EmployeeResponse(
      success: json['success'],
      data: List<EmployeeData>.from(json['data'].map((e) => EmployeeData.fromJson(e))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class EmployeeData {
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

  EmployeeData({
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

  factory EmployeeData.fromJson(Map<String, dynamic> json) {
    return EmployeeData(
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'hire_date': hireDate,
      'bank_account': bankAccount,
      'ssin': ssin,
      'national_id_photo': nationalIdPhoto,
      'contract_image': contractImage,
      'profile_image': profileImage,
      'department_id': departmentId,
      'role_id': roleId,
      'salary_id': salaryId,
      'position_id': positionId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'email_verified_at': emailVerifiedAt,
    };
  }
}
