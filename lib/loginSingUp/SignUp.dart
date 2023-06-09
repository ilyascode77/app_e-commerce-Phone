 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginSingUp/SignUpModel.dart';
import '../Widget/NavigatorBar.dart';
import 'LoginPage.dart';
import 'SingUpRespo.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

enum UserRole { admin, student }

bool _isEditing = false;
final _ctrname = TextEditingController();
final _ctrphone = TextEditingController();
final _ctrgmail = TextEditingController();
final _ctrpasswrd = TextEditingController();
final _ctrconfpasswrd = TextEditingController();
final _ctrCin = TextEditingController();
final _ctrCNE = TextEditingController();

class _SignUpState extends State<SignUp> {
  String? SelectedJob;
  String? SelectedSector;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  UserRole _selectedRole = UserRole.student;
  bool _showTextField = true; // Initially show the TextField for the admin role
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _emailExists = false;
  String _email = '';
  String _password = '';

  void _signup() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Store additional user information in Firebase database
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'role': _selectedRole.toString().split('.').last,
          // Add other user information as needed
        });

        // Navigate to relevant screens based on user role
        if (_selectedRole == UserRole.admin) {
          Navigator.pushNamed(context, '/admin_dashboard');
        } else {
          Navigator.pushNamed(context, '/student_dashboard');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//... other widgets here
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
//... other TextFormFields here
                          Text(
                            'Welcome,',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 10),
                            child: Text(
                              'Create your profile to start your requirement,',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 50, left: 15, bottom: 5, right: 15),
                            child: TextFormField(
                              controller: _ctrname,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                hintText: 'Enter username',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.orange,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter your username'
                                    : null;
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 15, bottom: 5, right: 15),
                            child: TextFormField(
                              controller: _ctrgmail,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter email',
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.orange,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onChanged: (String value) {
                                _email = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your email";
                                }
                                if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return "Please enter valid email('example@example.com')";
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 15, bottom: 5, right: 15),
                            child: TextFormField(
                              controller: _ctrphone,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Phone number',
                                hintText: 'Enter phone number',
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.orange,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please entre your phone number";
                                }
                                if (value.length <= 9) {
                                  return "phone number must contain 10 characters";
                                }
                                return null;
                              },
                            ),
                          ),
//... other TextFormFields here
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 15, bottom: 5, right: 15),
                            child: TextFormField(
                              controller: _ctrpasswrd,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.orange,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (String value) {
                                _password = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your password";
                                }
                                if (value.length < 6) {
                                  return "Password must contain at least 6 characters";
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 15, bottom: 5, right: 15),
                            child: TextFormField(
                              controller: _ctrconfpasswrd,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: 'Confirmation Password',
                                hintText: 'Enter confirmation password',
                                prefixIcon: Icon(
                                  Icons.lock_open,
                                  color: Colors.orange,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter confirmation password";
                                }
                                if (value != _password) {
                                  return "Confirmation password does not match";
                                }
                                return null;
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, left: 15, bottom: 5, right: 15),
                                child: Text("Select User"),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Radio<UserRole>(
                                value: UserRole.admin,
                                groupValue: _selectedRole,
                                onChanged: (UserRole? value) {
                                  setState(() {
                                    if (_selectedRole == UserRole.student) {
                                      // Reset the student information
                                      _ctrCNE.clear();
                                      SelectedSector = "0";
                                    }
                                    _selectedRole = value!;
                                    _showTextField =
                                        _selectedRole == UserRole.admin;
                                  });
                                },
                              ),
                              Text('Admin'),
                              Radio<UserRole>(
                                value: UserRole.student,
                                groupValue: _selectedRole,
                                onChanged: (UserRole? value) {
                                  setState(() {
                                    if (_selectedRole == UserRole.admin) {
                                      // Reset the admin information
                                      _ctrCin.clear();
                                      SelectedJob = "0";
                                    }
                                    _selectedRole = value!;
                                    _showTextField =
                                        _selectedRole == UserRole.admin;
                                  });
                                },
                              ),
                              Text('Student'),
                            ],
                          ),
                          if (_selectedRole == UserRole.admin)
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 15, bottom: 5, right: 15),
                              child: TextFormField(
                                controller: _ctrCin,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  labelText: 'Cin',
                                  hintText: 'Enter your Cin',
                                  prefixIcon: Icon(
                                    Icons.credit_card_rounded,
                                    color: Colors.orange,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onChanged: (String value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your Cin code";
                                  }
                                  if (!RegExp(r"^[a-zA-Z]{2}\d{5,6}$")
                                      .hasMatch(value)) {
                                    return "Please enter a valid Cin code example ('AB12345' or 'CD123456')";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          if (_selectedRole == UserRole.admin)
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 15, bottom: 5, right: 15),
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("Jobs")
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  List<DropdownMenuItem<String>> jobsItems = [];
                                  if (!snapshot.hasData) {
                                    return CircularProgressIndicator();
                                  } else {
                                    final jobs =
                                        snapshot.data?.docs.reversed.toList();
                                    jobsItems.add(
                                      DropdownMenuItem<String>(
                                        value: "0",
                                        child: Text('Select Job'),
                                      ),
                                    );
                                    for (var job in jobs!) {
                                      jobsItems.add(
                                        DropdownMenuItem<String>(
                                          value: job['name'],
                                          child: Text(job['name']),
                                        ),
                                      );
                                    }
                                  }
                                  return Container(
                                    width: 400,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black54,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: DropdownButton<String>(
                                      items: jobsItems,
                                      onChanged: (jobsValue) {
                                        setState(() {
                                          SelectedJob = jobsValue!;
                                        });
                                      },
                                      value: SelectedJob,
                                      isExpanded: false,
                                      hint: Text(
                                        'Select Job',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          if (_selectedRole == UserRole.student)
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 15, bottom: 5, right: 15),
                              child: TextFormField(
                                controller: _ctrCNE,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  labelText: 'CNE',
                                  hintText: 'Enter your CNE',
                                  prefixIcon: Icon(
                                    Icons.credit_card_rounded,
                                    color: Colors.orange,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onChanged: (String value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your CNE code";
                                  }
                                  if (!RegExp(r"^[a-zA-Z]\d{9}$")
                                      .hasMatch(value)) {
                                    return "Please enter a valid CNE code example('D139170170')";
                                  }

                                  return null;
                                },
                              ),
                            ),
                          if (_selectedRole == UserRole.student)
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 15, bottom: 5, right: 15),
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("Sectors")
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  List<DropdownMenuItem> sectorsItems = [];
                                  if (!snapshot.hasData) {
                                    return CircularProgressIndicator();
                                  } else {
                                    final sectors =
                                        snapshot.data?.docs.reversed.toList();
                                    sectorsItems.add(
                                      DropdownMenuItem(
                                        value: "0",
                                        child: Text('Select Sectors'),
                                      ),
                                    );
                                    for (var sector in sectors!) {
                                      sectorsItems.add(
                                        DropdownMenuItem(
                                          value: sector['name'],
                                          child: Text(sector['name']),
                                        ),
                                      );
                                    }
                                  }
                                  return Container(
                                    width: 400,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black54,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: DropdownButton(
                                      items: sectorsItems,
                                      onChanged: (sectorsValue) {
                                        setState(() {
                                          SelectedSector =
                                              sectorsValue.toString();
                                        });
                                      },
                                      value: SelectedSector,
                                      isExpanded: false,
                                      hint: Text(
                                        'Select Sector',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      Future.delayed(Duration(seconds: 4), () {
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  navigatorBar()),
                                        );
                                      });
                                      return AlertDialog(
                                        title: Row(
                                          children: [],
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            navigatorBar()));
                                              },
                                              child: Image.asset(
                                                'images/tchek.jpg',
                                                width: 100,
                                                height: 100,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Text(
                                              'Successful registration!',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 10),
                                            Text('Welcome among us'),
                                          ],
                                        ),
                                        actions: [],
                                      );
                                    },
                                  );
                                }
                                final user = Users(
                                  name: _ctrname.text,
                                  gmail: _ctrgmail.text,
                                  passwrd: _ctrpasswrd.text,
                                  confpasswd: _ctrconfpasswrd.text,
                                  CNE: _ctrCNE.text,
                                  Job: SelectedJob ?? "",
                                  Sector: SelectedSector ?? "",
                                  Cin: _ctrCin.text,
                                  phone: int.parse(_ctrphone.text.toString()),
                                  UserRole: _selectedRole != null
                                      ? _selectedRole.toString().split('.').last
                                      : '',
                                );
                                addUser(user);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Set the desired border radius here
                                ),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                child: Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Do you have account ?',
                              ),
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigate to the login page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                    );
                                  },
                                  child: Text(
                                    ' Login.',
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
