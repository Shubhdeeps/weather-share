import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

final storageRef = FirebaseStorage.instance.ref();

CollectionReference profileRef =
    FirebaseFirestore.instance.collection("profiles");

CollectionReference userPostRef =
    FirebaseFirestore.instance.collection("user_posts");

User? get currentUser => auth.currentUser;
Stream<User?> get authStateChanges => auth.authStateChanges();
