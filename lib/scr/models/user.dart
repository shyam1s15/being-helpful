import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "id";

  late String _name;
  late String _email;
  late String _id;

//    getters

    String get name => _name;
    String get email => _email;
    String get id => _id;

    UserModel.fromSnapshot(DocumentSnapshot snapshot){
        _name = snapshot[NAME];
        _email = snapshot[EMAIL];
        _id = snapshot[ID];
    }
}
