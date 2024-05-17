import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kabrgy/screens/home_screen.dart';
import 'package:kabrgy/screens/welcome_screen.dart';

class Services {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get onAuthStateChanged => _firebaseAuth.authStateChanges();

  Future<void> signOUt({
    required BuildContext context
  }) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Welcome()));

  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Home()));
  }

  Future<void> register({
    required String email,
    required String password,
    required String barangay,
    required BuildContext context
  }) async {

    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Home()));
      
      FirebaseFirestore.instance.collection('skUser').doc(email).set({
        'email': email,
        'barangay': barangay,
        'createdOn': DateTime.now()
      });

      final req1 = {
        'title': 'Comprehensive Barangay Youth Investment Program',
        'userAssigned': email,
        'status': 'Todo',
        'dueDate': DateTime.now(),
        'description': 'Ut ipsam nihil quo earum soluta rem possimus quidem et minima voluptas? Rem architecto cumque qui enim iusto ea itaque dolorem. Aut ipsam harum et deserunt nihil ex necessitatibus mollitia qui distinctio error. Ab dolorem eius vel animi voluptate aut ducimus obcaecati cum omnis dolorum sed error autem sit deleniti incidunt aut quos voluptate.',
        'criteria': [
         {
          'title': 'title',
          'content': 'content',
          'percent': '50%'
         },
         {
          'title': 'title',
          'content': 'content',
          'percent': '30%'
         },
         {
          'title': 'title',
          'content': 'content',
          'percent': '20%'
         },
        ]
      };

      final req2 = {
        'title': 'Annual Barangay Youth Investment Program',
        'userAssigned': email,
        'status': 'Todo',
        'dueDate': DateTime.now(),
        'description': 'Ut ipsam nihil quo earum soluta rem possimus quidem et minima voluptas? Rem architecto cumque qui enim iusto ea itaque dolorem. Aut ipsam harum et deserunt nihil ex necessitatibus mollitia qui distinctio error. Ab dolorem eius vel animi voluptate aut ducimus obcaecati cum omnis dolorum sed error autem sit deleniti incidunt aut quos voluptate.',
        'criteria': [
         {
          'title': 'title',
          'content': 'content',
          'percent': '50%'
         },
         {
          'title': 'title',
          'content': 'content',
          'percent': '30%'
         },
         {
          'title': 'title',
          'content': 'content',
          'percent': '20%'
         },
        ]
      };

      final req3 = {
        'title': 'Annual Budget',
        'userAssigned': email,
        'status': 'Todo',
        'dueDate': DateTime.now(),
        'description': 'Ut ipsam nihil quo earum soluta rem possimus quidem et minima voluptas? Rem architecto cumque qui enim iusto ea itaque dolorem. Aut ipsam harum et deserunt nihil ex necessitatibus mollitia qui distinctio error. Ab dolorem eius vel animi voluptate aut ducimus obcaecati cum omnis dolorum sed error autem sit deleniti incidunt aut quos voluptate.',
        'criteria': [
         {
          'title': 'title',
          'content': 'content',
          'percent': '50%'
         },
         {
          'title': 'title',
          'content': 'content',
          'percent': '30%'
         },
         {
          'title': 'title',
          'content': 'content',
          'percent': '20%'
         },
        ]
      };

      FirebaseFirestore.instance.collection('requirements').doc().set(req1);
      FirebaseFirestore.instance.collection('requirements').doc().set(req2);
      FirebaseFirestore.instance.collection('requirements').doc().set(req3);

    } on FirebaseAuthException catch (e) {
      
      if (e.code == 'weak-password') {
        print('error: weak pass');
      } else {
        print('error: acc already exists');
      }

    }
  }
}