import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:lead_flow/utils/logger.dart';

@injectable
class FunnelRepository {
  final FirebaseFirestore _firestore;

  FunnelRepository(this._firestore);

  Future<void> updateFirestoreDocument(
    String uid,
    String project,
    String session,
    int index,
    String answer,
  ) async {
    try {
      final DocumentReference docRef =
          _firestore.collection(uid).doc(project).collection('formAnswers').doc(session);

      final DocumentSnapshot docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        await docRef.update({index: answer});
        appLog('Document $uid $project $index updated successfully');
      } else {
        await docRef.set({index: answer});
        appLog('New document $uid $project $index created');
      }
    } catch (error) {
      appLog('Error updating document: $error');
      rethrow;
    }
  }
}
