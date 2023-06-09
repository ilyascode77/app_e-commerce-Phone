 
import 'package:flutter/material.dart';
import '../loginSingUp/SignUpModel.dart';
import '../loginSingUp/SingUpRespo.dart';

class ListUser extends StatefulWidget {
  final Users user;

  ListUser({required this.user, required List users});

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  final _formKey = GlobalKey<FormState>();

  final _ctrupdname = TextEditingController();
  final _ctrupdemail = TextEditingController();
  final _ctrupdphone = TextEditingController();
  final _ctrupdpassword = TextEditingController();
  final _ctrupdconfpassword = TextEditingController();
  final _ctrupdpdCIN = TextEditingController();
  final _ctrupdCNE = TextEditingController();
  final _ctrupdpUserRole = TextEditingController();
  void handleItemTap(selectedItem) {
    // Do something if Item 1 is selected
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField(
                labelText: 'Username',
                initialValue: widget.user.name,
                enabled: false,
                controller: _ctrupdname,
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 10),
              buildTextField(
                labelText: 'Email',
                initialValue: widget.user.gmail,
                enabled: false,
                controller: _ctrupdemail,
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(height: 10),
              buildTextField(
                labelText: 'Password',
                initialValue: widget.user.passwrd,
                enabled: false,
                controller: _ctrupdpassword,
                prefixIcon: Icon(Icons.password),
              ),
              SizedBox(height: 10),
              buildTextField(
                labelText: 'Phone',
                initialValue: widget.user.phone.toString(),
                enabled: false,
                controller: _ctrupdphone,
                prefixIcon: Icon(Icons.phone),
              ),
              SizedBox(height: 10),
              buildTextField(
                labelText: 'User Role',
                initialValue: widget.user.UserRole,
                enabled: false,
                prefixIcon: Icon(Icons.perm_contact_cal_sharp),
              ),
              SizedBox(height: 10),
              buildTextField(
                labelText: 'Job',
                initialValue: widget.user.Job,
                enabled: false,
                prefixIcon: Icon(Icons.work),
              ),
              SizedBox(height: 10),
              buildTextField(
                labelText: 'CIN',
                initialValue: widget.user.Cin,
                enabled: false,
                prefixIcon: Icon(Icons.credit_card_rounded),
              ),
              SizedBox(height: 10),
              buildTextField(
                labelText: 'Sector',
                initialValue: widget.user.Sector,
                enabled: false,
                prefixIcon: Icon(Icons.work_outline_outlined),
              ),
              SizedBox(height: 10),
              buildTextField(
                labelText: 'CNE',
                initialValue: widget.user.CNE,
                enabled: false,
                prefixIcon: Icon(Icons.book),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 50),
                child: GestureDetector(
                  onTap: () {
                    _ctrupdname.text = widget.user.name;
                    _ctrupdemail.text = widget.user.gmail;
                    _ctrupdphone.text = widget.user.phone.toString();
                    _ctrupdpassword.text = widget.user.passwrd;
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        alignment: Alignment.center,
                        title: Text('Update account: ${widget.user.name}'),
                        content: SingleChildScrollView(
                          child: Container(
                            height: 400,
                            width: 500,
                            child: Column(
                              children: [
                                buildTextField(
                                  labelText: 'Name',
                                  controller: _ctrupdname,
                                  prefixIcon: Icon(Icons.person),
                                ),
                                buildTextField(
                                  labelText: 'Email',
                                  controller: _ctrupdemail,
                                  prefixIcon: Icon(Icons.email),
                                ),
                                buildTextField(
                                  labelText: 'Phone',
                                  controller: _ctrupdphone,
                                  prefixIcon: Icon(Icons.phone),
                                ),
                                buildTextField(
                                  labelText: 'Password',
                                  controller: _ctrupdpassword,
                                  prefixIcon: Icon(Icons.password),
                                ),
                                buildTextField(
                                  labelText: 'User Role',
                                  controller: _ctrupdpUserRole,
                                  prefixIcon: Icon(Icons.password),
                                ),
                                buildTextField(
                                  labelText: 'Cin',
                                  controller: _ctrupdCNE,
                                  prefixIcon: Icon(Icons.password),
                                ),
                                buildTextField(
                                  labelText: 'CNE',
                                  controller: _ctrupdpdCIN,
                                  prefixIcon: Icon(Icons.password),
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          Row(
                            children: [
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    final users = Users(
                                      id: widget.user.id,
                                      name: _ctrupdname.text,
                                      gmail: _ctrupdemail.text,
                                      phone: int.parse(_ctrupdphone.text),
                                      passwrd: _ctrupdpassword.text,
                                      confpasswd: _ctrupdconfpassword.text,
                                      UserRole: '',
                                      Cin: '',
                                      Job: '',
                                      CNE: '',
                                      Sector: '',
                                    );
                                    updateUser(users);
                                  },
                                  child: Container(
                                    child: Text('Update'),
                                  ),
                                ),
                              ),
                              SizedBox(width: 30.0),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  child: Text('Cancel'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Update my account',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextField({
    required String labelText,
    String? initialValue,
    bool enabled = true,
    TextEditingController? controller,
    Widget? prefixIcon,
  }) {
    if (controller != null) {
      return TextFormField(
        enabled: enabled,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon,
          labelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[300],
        ),
      );
    } else {
      return TextFormField(
        initialValue: initialValue,
        enabled: enabled,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon,
          labelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[300],
        ),
      );
    }
  }
}
