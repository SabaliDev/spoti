import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spoti/data/models/auth/create_user_req.dart';
import 'package:spoti/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);

      return const Right('Signin was Successful');
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'invalid-email') {
        message = "No user for email";
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong Password';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      FirebaseFirestore.instance
          .collection('Users')
          .add({'name': createUserReq.fullName, 'email': data.user?.email});
      return const Right('Signup was Successful');
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'weak-password':
          message = "The password is too weak";
          break;
        case 'email-already-in-use':
          message = 'An account already exists for this email';
          break;
        case 'invalid-email':
          message = 'The email address is not valid';
          break;
        case 'operation-not-allowed':
          message = 'Email/password accounts are not enabled';
          break;
        default:
          message = 'An error occurred: ${e.message}';
      }
      return Left(message);
    } catch (e) {
      return const Left('An unexpected error occurred');
    }
  }
}
