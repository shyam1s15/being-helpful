import 'package:being_helpful/scr/helpers/user.dart';
import 'package:being_helpful/scr/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum Status { Unintiallized, Unauthenciated, Authenticating, Authenticated }

class AuthProvider with ChangeNotifier {
  late FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;
  Status _status = Status.Unintiallized;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserServices _userServices = UserServices();

  UserModel? _userModel;
//  getters

  UserModel? get userModel => _userModel;
  Status get status => _status;

  // UserModel get UserModel => _userModel;
  User get user => _user;
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen((event) {
      _onStateChanged(event);
    });
  }

  Future<void> _onStateChanged(User? firebaseUser) async {
    // we didnt get anything from firebase
    if (firebaseUser == null) {
      _status = Status.Unintiallized;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(firebaseUser.uid);
    }
    notifyListeners();
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text);
      return true;
    } catch (e) {
      _status = Status.Unauthenciated;
      notifyListeners();
      print("error: " + e.toString());
      return false;
    }
  }

  Future<bool> signUp() async {
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text).then((firebaseUser) {
        Map<String, dynamic> values = {
            "name": name.text,
          "email":email.text.trim(),
          "id": firebaseUser.user!.uid
        };
        _userServices.createUser(values);
      });
      return true;
    }catch(e){
     bool value =  _onError(e.toString());
     return value;

    // _status = Status.Unauthenciated;
    // notifyListeners();
    // print(e.toString());
    return false;
    }
  }

  Future signOut(){
    _auth.signOut();
    _status = Status.Unauthenciated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }



  //general methods
  bool _onError(String error){
    _status = Status.Unauthenciated;
    notifyListeners();
    print("We got an $error");
    return false;
  }

  void cleanController(){
    email.text = "";
    password.text = "";
    name.text = "";
  }
}
