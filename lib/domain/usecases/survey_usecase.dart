import 'package:gym_bot/domain/repository/survey_repository.dart';
import 'package:gym_bot/data/models/survey_data.dart';

class SurveyUsecase {
  final SurveyRepository surveyRepository;

  SurveyUsecase({required this.surveyRepository});

  void addSurvey(SurveyData surveyData) {
    surveyRepository.addSurvey(surveyData);
  }
}
