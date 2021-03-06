class UserModel {
  String _fullName;
  String _email;
  String _birthdate;
  String _password;

  UserModel({
    String fullName,
    String email,
    String birthdate,
    String password,
  }) {
    this._fullName = fullName;
    this._email = email;
    this._birthdate = birthdate;
    this._password = password;
  }

  String get fullName => _fullName;
  set fullName(String fullName) => _fullName = fullName;
  String get email => _email;
  set email(String email) => _email = email;
  String get birthdate => _birthdate;
  set birthdate(String birthdate) => _birthdate = birthdate;
  String get password => _password;
  set password(String password) => _password = password;

  UserModel.fromJson(Map<String, dynamic> json) {
    _fullName = json['fullName'];
    _email = json['email'];
    _birthdate = json['birthdate'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this._fullName;
    data['email'] = this._email;
    data['birthdate'] = this._birthdate;
    data['password'] = this._password;
    return data;
  }

  String getInitials() {
    final List<String> splitName = fullName.split(" ");
    final String initials = splitName.length > 1
        ? "${splitName[0][0]}${splitName[1][0]}"
        : "${splitName[0][0]}";
    return initials.toUpperCase();
  }
}
