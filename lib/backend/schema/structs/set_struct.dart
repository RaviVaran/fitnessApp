// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SetStruct extends FFFirebaseStruct {
  SetStruct({
    int? weight,
    int? reps,
    List<SetStruct>? sets,
    int? number,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _weight = weight,
        _reps = reps,
        _sets = sets,
        _number = number,
        super(firestoreUtilData);

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  set weight(int? val) => _weight = val;
  void incrementWeight(int amount) => _weight = weight + amount;
  bool hasWeight() => _weight != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  set reps(int? val) => _reps = val;
  void incrementReps(int amount) => _reps = reps + amount;
  bool hasReps() => _reps != null;

  // "sets" field.
  List<SetStruct>? _sets;
  List<SetStruct> get sets => _sets ?? const [];
  set sets(List<SetStruct>? val) => _sets = val;
  void updateSets(Function(List<SetStruct>) updateFn) => updateFn(_sets ??= []);
  bool hasSets() => _sets != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;
  void incrementNumber(int amount) => _number = number + amount;
  bool hasNumber() => _number != null;

  static SetStruct fromMap(Map<String, dynamic> data) => SetStruct(
        weight: castToType<int>(data['weight']),
        reps: castToType<int>(data['reps']),
        sets: getStructList(
          data['sets'],
          SetStruct.fromMap,
        ),
        number: castToType<int>(data['number']),
      );

  static SetStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SetStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'weight': _weight,
        'reps': _reps,
        'sets': _sets?.map((e) => e.toMap()).toList(),
        'number': _number,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'weight': serializeParam(
          _weight,
          ParamType.int,
        ),
        'reps': serializeParam(
          _reps,
          ParamType.int,
        ),
        'sets': serializeParam(
          _sets,
          ParamType.DataStruct,
          true,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
      }.withoutNulls;

  static SetStruct fromSerializableMap(Map<String, dynamic> data) => SetStruct(
        weight: deserializeParam(
          data['weight'],
          ParamType.int,
          false,
        ),
        reps: deserializeParam(
          data['reps'],
          ParamType.int,
          false,
        ),
        sets: deserializeStructParam<SetStruct>(
          data['sets'],
          ParamType.DataStruct,
          true,
          structBuilder: SetStruct.fromSerializableMap,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SetStruct &&
        weight == other.weight &&
        reps == other.reps &&
        listEquality.equals(sets, other.sets) &&
        number == other.number;
  }

  @override
  int get hashCode => const ListEquality().hash([weight, reps, sets, number]);
}

SetStruct createSetStruct({
  int? weight,
  int? reps,
  int? number,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SetStruct(
      weight: weight,
      reps: reps,
      number: number,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SetStruct? updateSetStruct(
  SetStruct? set, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    set
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSetStructData(
  Map<String, dynamic> firestoreData,
  SetStruct? set,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (set == null) {
    return;
  }
  if (set.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && set.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final setData = getSetFirestoreData(set, forFieldValue);
  final nestedData = setData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = set.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSetFirestoreData(
  SetStruct? set, [
  bool forFieldValue = false,
]) {
  if (set == null) {
    return {};
  }
  final firestoreData = mapToFirestore(set.toMap());

  // Add any Firestore field values
  set.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSetListFirestoreData(
  List<SetStruct>? sets,
) =>
    sets?.map((e) => getSetFirestoreData(e, true)).toList() ?? [];
