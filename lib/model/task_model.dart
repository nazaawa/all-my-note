class Task {
  int id;
  String title;
  String date;
  String priority;
  int status;
  Task(
      {required this.id,
      required this.title,
      required this.date,
      required this.priority,
      required this.status});
  Task.withId(
      {required this.id,
      required this.title,
      required this.date,
      required this.priority,
      required this.status});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map["id"] = id;

    map["title"] = title;
    map["date"] = date;
    map["priority"] = priority;
    map["status"] = status;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return new Task.withId(
        id: map["id"],
        title: map["title"],
        date: map["date"],
        priority: map["priority"],
        status: map['status']);
  }
}
