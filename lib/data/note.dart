class Note {
  int id;
  String task;

  Note(this.id, this.task);

  Map<String, dynamic> toMap() => {"id": id, "task": task};
  factory Note.fromMap(Map<String, dynamic> map) =>
      Note(map["id"], map["task"]);
}
