import 'package:flutter/material.dart';
import 'package:gym_bot/data/models/survey_data.dart';
import 'package:gym_bot/domain/usecases/survey_usecase.dart';
import 'package:gym_bot/domain/repository/survey_repository.dart';

void main() => runApp(SurveyApp());

class SurveyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Survey App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SurveyPage(),
    );
  }
}

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  Map<String, dynamic> surveyData = {};
  List<String> questions = ['machine', 'extime', 'experienceLevel'];
  final SurveyUsecase surveyUseCase =
      SurveyUsecase(surveyRepository: SurveyRepository());

  void updateSurveyData(String question, dynamic answer) {
    setState(() {
      surveyData[question] = answer;
    });
  }

  void submitSurvey() {
    for (int i = 0; i < questions.length; i++)
      if (surveyData[questions[i]] == null) {
        print("survey_page : Select all questions");
        return;
      }

    SurveyData surveymodel = SurveyData(
      machine: surveyData['machine'],
      extime: surveyData['extime'],
      experienceLevel: surveyData['experienceLevel'],
    );
    surveyUseCase.addSurvey(surveymodel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gym-Bot 설문조사'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '가장 선호하는 운동 기구는 무엇인가요?',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              title: Text('히히'),
              value: 'smith',
              groupValue: surveyData['machine'],
              onChanged: (value) {
                updateSurveyData('machine', value);
              },
            ),
            RadioListTile(
              title: Text('트레드밀'),
              value: 'treadmill',
              groupValue: surveyData['machine'],
              onChanged: (value) {
                updateSurveyData('machine', value);
              },
            ),
            RadioListTile(
              title: Text('벤치프레스'),
              value: 'benchpress',
              groupValue: surveyData['machine'],
              onChanged: (value) {
                updateSurveyData('machine', value);
              },
            ),
            SizedBox(height: 20.0),
            Text(
              '어느 시간대에 운동하는 것을 선호하시나요?',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('오전'),
              value: surveyData['extime']?.contains('morning') ?? false,
              onChanged: (value) {
                setState(() {
                  if (value ?? false) {
                    updateSurveyData('extime', 'morning');
                  } else {
                    updateSurveyData('extime', null);
                  }
                });
              },
            ),
            CheckboxListTile(
              title: Text('오후'),
              value: surveyData['extime']?.contains('afternoon') ?? false,
              onChanged: (value) {
                setState(() {
                  if (value ?? false) {
                    updateSurveyData('extime', 'afternoon');
                  } else {
                    updateSurveyData('extime', null);
                  }
                });
              },
            ),
            SizedBox(height: 20.0),
            Text(
              '당신의 운동 수준은 어느 정도인가요?',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              value: surveyData['experienceLevel'],
              onChanged: (value) {
                updateSurveyData('experienceLevel', value);
              },
              items: ['Beginner', 'Intermediate', 'Advanced']
                  .map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: submitSurvey,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
