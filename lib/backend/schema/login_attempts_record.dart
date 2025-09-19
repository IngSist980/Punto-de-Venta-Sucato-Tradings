import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoginAttemptsRecord extends FirestoreRecord {
  LoginAttemptsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mail" field.
  String? _mail;
  String get mail => _mail ?? '';
  bool hasMail() => _mail != null;

  // "failedAttempts" field.
  int? _failedAttempts;
  int get failedAttempts => _failedAttempts ?? 0;
  bool hasFailedAttempts() => _failedAttempts != null;

  // "lastFailedAt" field.
  DateTime? _lastFailedAt;
  DateTime? get lastFailedAt => _lastFailedAt;
  bool hasLastFailedAt() => _lastFailedAt != null;

  void _initializeFields() {
    _mail = snapshotData['mail'] as String?;
    _failedAttempts = castToType<int>(snapshotData['failedAttempts']);
    _lastFailedAt = snapshotData['lastFailedAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('loginAttempts');

  static Stream<LoginAttemptsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LoginAttemptsRecord.fromSnapshot(s));

  static Future<LoginAttemptsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LoginAttemptsRecord.fromSnapshot(s));

  static LoginAttemptsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LoginAttemptsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LoginAttemptsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LoginAttemptsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LoginAttemptsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LoginAttemptsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLoginAttemptsRecordData({
  String? mail,
  int? failedAttempts,
  DateTime? lastFailedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mail': mail,
      'failedAttempts': failedAttempts,
      'lastFailedAt': lastFailedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class LoginAttemptsRecordDocumentEquality
    implements Equality<LoginAttemptsRecord> {
  const LoginAttemptsRecordDocumentEquality();

  @override
  bool equals(LoginAttemptsRecord? e1, LoginAttemptsRecord? e2) {
    return e1?.mail == e2?.mail &&
        e1?.failedAttempts == e2?.failedAttempts &&
        e1?.lastFailedAt == e2?.lastFailedAt;
  }

  @override
  int hash(LoginAttemptsRecord? e) =>
      const ListEquality().hash([e?.mail, e?.failedAttempts, e?.lastFailedAt]);

  @override
  bool isValidKey(Object? o) => o is LoginAttemptsRecord;
}
