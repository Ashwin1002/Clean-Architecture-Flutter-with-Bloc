enum UserRole {
  admin('AD', 'Admin'),
  teacher('TE', 'Teacher'),
  student('ST', 'Student'),
  parent('PA', 'Parent');

  const UserRole(this.value, this.role);

  final String value;
  final String role;

  static UserRole fromValue(String value) => UserRole.values
      .firstWhere((e) => e.value == value, orElse: () => UserRole.student);

  static UserRole fromRole(String role) => UserRole.values
      .firstWhere((e) => e.role == role, orElse: () => UserRole.student);

  bool get isAdmin => this == UserRole.admin;
  bool get isTeacher => this == UserRole.teacher;
  bool get isStudent => this == UserRole.student;
  bool get isParent => this == UserRole.parent;
}
