import 'package:flutter/material.dart';

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

  void updateSurveyData(String question, dynamic answer) {
    setState(() {
      surveyData[question] = answer;
    });
  }

  void submitSurvey() {
    // 설문조사 데이터를 처리하는 로직 추가
    print(surveyData);
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
              title: Text('스미스'),
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
