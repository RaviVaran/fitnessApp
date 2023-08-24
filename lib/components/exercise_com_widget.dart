import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'exercise_com_model.dart';
export 'exercise_com_model.dart';

class ExerciseComWidget extends StatefulWidget {
  const ExerciseComWidget({Key? key}) : super(key: key);

  @override
  _ExerciseComWidgetState createState() => _ExerciseComWidgetState();
}

class _ExerciseComWidgetState extends State<ExerciseComWidget> {
  late ExerciseComModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExerciseComModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Add(${formatNumber(
                    _model.total,
                    formatType: FormatType.custom,
                    format: '',
                    locale: '',
                  )})',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
            StreamBuilder<List<ExercisesRecord>>(
              stream: queryExercisesRecord(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<ExercisesRecord> listViewExercisesRecordList =
                    snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewExercisesRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewExercisesRecord =
                        listViewExercisesRecordList[listViewIndex];
                    return Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      child: CheckboxListTile(
                        value: _model.checkboxListTileValueMap[
                            listViewExercisesRecord] ??= false,
                        onChanged: (newValue) async {
                          setState(() => _model.checkboxListTileValueMap[
                              listViewExercisesRecord] = newValue!);
                          if (newValue!) {
                            setState(() {
                              _model.total = _model.total! + 1;
                            });
                            setState(() {
                              FFAppState().updateWorkoutStruct(
                                (e) => e
                                  ..updateExercise(
                                    (e) => e.add(ExerciseStruct(
                                      exerciseRef:
                                          listViewExercisesRecord.reference,
                                      sets: functions.createSet(),
                                    )),
                                  ),
                              );
                            });
                          } else {
                            setState(() {
                              _model.total = _model.total! + -1;
                            });
                          }
                        },
                        title: Text(
                          listViewExercisesRecord.name,
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                        subtitle: Text(
                          listViewExercisesRecord.bodyPart,
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: FlutterFlowTheme.of(context).info,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
