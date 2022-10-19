class BaseURL {
  static const String host = 'https://app.porteursdevie.org/api'; //sereur en production
  //static const String host = 'http://10.0.2.2:8000/api';  //sereur en local
  //static const String host = 'https://api.porteursdevie.org/api'; //serveur de test
  static const String church = '/church';
  static const String login = '/auth/login';
  static const String studentdata = '/student/data';
  static const String moduledata = '/module/data';
  static const String studentstore = '/student/store';
  static const String reinscriptionLogin = '/reinscription/login';

  static String getbyschoolfromstudent(int id) {
    return '/get_by_school_from_student/$id/data';
  }

  static String getstudentcoursshowdata(int id) {
    return '/student/cours/$id/show/data';
  }

  static String getresponsebyquestion(int id) {
    return '/cours/response/$id/question/data';
  }
}
