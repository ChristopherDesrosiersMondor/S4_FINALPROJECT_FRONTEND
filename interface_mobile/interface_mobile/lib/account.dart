class Account {
  final int userId;
  final String userLastName;
  final String userFirstName;
  final String userEmail;
  final String userPseudo;
  final String userPassword;
  final DateTime userBirthday;

  const Account({
    required this.userId,
    required this.userLastName,
    required this.userFirstName,
    required this.userEmail,
    required this.userPseudo,
    required this.userPassword,
    required this.userBirthday,
  });

  // permet de transformer une entité en format json pour la communication avec l'API
  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        userId: json['userId'],
        userLastName: json['userLastName'],
        userFirstName: json['userFirstName'],
        userEmail: json['userEmail'],
        userPseudo: json['userPseudo'],
        userPassword: json['userPassword'],
        userBirthday: json['userBirthday']);
  }
}
