class Users {
  String id;
  String name;
  String gmail;
  int phone;
  String passwrd;
  bool loggedIn;
  String confpasswd;
  String UserRole;
  String Cin;
  String Job;
  String CNE;
  String Sector;
  Users({
    this.id = '',
    required this.name,
    required this.gmail,
    required this.phone,
    required this.passwrd,
    this.loggedIn = true,
    required this.confpasswd,
    required this.UserRole,
    required this.Cin,
    required this.Job,
    required this.CNE,
    required this.Sector,
  });
  //---------------------------------------------------------
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gmail': gmail,
      'phone': phone,
      'passwrd': passwrd,
      'loggedIn': loggedIn,
      'confpassword': confpasswd,
      'UserRole': UserRole,
      'Cin': Cin,
      'Job': Job,
      'CNE': CNE,
      'Sector': Sector,
    };
  }

  //--------------------------------------------------------
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      name: json['name'],
      gmail: json['gmail'],
      phone: json['phone'],
      passwrd: json['passwrd'],
      loggedIn: json['loggedIn'],
      confpasswd: json['confpassword'],
      UserRole: json['UserRole'],
      Cin: json['Cin'],
      Job: json['Job'],
      CNE: json['CNE'],
      Sector: json['Sector'],
    );
  }
}
