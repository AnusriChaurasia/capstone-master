//// Embedded Maps
class Option {
  String value;
  String detail;
  bool correct;

  Option({this.correct, this.value, this.detail});
  Option.fromMap(Map<dynamic, dynamic> data) {
    value = data['value'];
    detail = data['detail'] ?? '';
    correct = data['correct'];
  }
}

class Question {
  String text;
  List<Option> options;
  Question({this.options, this.text});

  Question.fromMap(Map data) {
    text = data['text'] ?? '';
    options =
        (data['options'] as List ?? []).map((v) => Option.fromMap(v)).toList();
  }
}

///// Database Collections
class Quiz {
  String id;
  String title;
  String description;
  String video;
  String topic;
  List<Question> questions;

  Quiz(
      {this.title,
      this.questions,
      this.video,
      this.description,
      this.id,
      this.topic});

  factory Quiz.fromMap(Map<String, dynamic> data) {
    return Quiz(
        id: data['id'] ?? '',
        title: data['title'] ?? '',
        topic: data['topic'] ?? '',
        description: data['description'] ?? '',
        video: data['video'] ?? '',
        questions: (data['questions'] as List ?? [])
            .map((v) => Question.fromMap(v))
            .toList());
  }
}

class Topic {
  final String id;
  final String title;
  final String description;
  final String img;
  final List<Quiz> quizzes;

  Topic({this.id, this.title, this.description, this.img, this.quizzes});

  factory Topic.fromMap(Map<dynamic, dynamic> data) {
    print('data recieved in topic global is' + data.toString());
    return Topic(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      img: data['img'] ?? 'default.png',
      quizzes: (data['quizzes'] as List ?? [])
          .map((v) => Quiz.fromMap(v))
          .toList(), //data['quizzes'],
    );
  }
}

class Report {
  String uid;
  int total;
  dynamic topics;

  Report({this.uid, this.topics, this.total});

  factory Report.fromMap(Map<dynamic, dynamic> data) {
    return Report(
      uid: data['uid'],
      total: data['total'] ?? 0,
      topics: data['topics'] ?? {},
    );
  }
}
