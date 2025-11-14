import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorService {
  final CollectionReference doctorsRef =
  FirebaseFirestore.instance.collection('doctors');

  Stream<QuerySnapshot> getAllDoctors() {
    return doctorsRef.snapshots();
  }
}
