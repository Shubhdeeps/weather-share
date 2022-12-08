import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

// Storage
// final storage =
//     FirebaseStorage.instanceFor(bucket: "gs://weather-share-40076.appspot.com");
final storageRef = FirebaseStorage.instance.ref();

CollectionReference profileRef =
    FirebaseFirestore.instance.collection("profiles");
