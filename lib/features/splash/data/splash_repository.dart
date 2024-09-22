import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:lead_flow/data/dto/body_dto.dart';
import 'package:lead_flow/features/splash/model/client_data.dart';

@injectable
class SplashRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  SplashRepository(this._firestore, this._auth);

  Future<BodyDTO?> getClientFunnel(String uid, String project, String mediaType) async {
    try {
      final docRef = _firestore.collection(uid).doc(project);
      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) return null;

      final data = docSnapshot.data() as Map<String, dynamic>;
      _incrementMediaCount(docRef, mediaType);

      return BodyDTO.fromJson(ClientData.fromMap(data).form);
    } catch (e) {
      log('Error fetching client data: $e');
      return null;
    }
  }

  Future _incrementMediaCount(DocumentReference docRef, String mediaType) async {
    try {
      await docRef.update({mediaType: FieldValue.increment(1)});
    } catch (e) {
      log('Error incrementing Instagram count: $e');
    }
  }

  bool isUserSignedIn()  => _auth.currentUser != null;
}
