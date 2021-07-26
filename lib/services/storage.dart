class TaskDataModel {
  final String headline;
  final String task;
  final DateTime creationDate;
  final bool isDone;
  var finishedDate;

  TaskDataModel(
      {required this.headline,
      this.task = "",
      required this.creationDate,
      this.isDone = false,
      this.finishedDate});
}

class WeeklyDataModel {
  final String task;
  final DateTime creationDate;
  final bool isDone;
  final int amount;

  WeeklyDataModel(
      {required this.task,
      required this.creationDate,
      this.isDone = false,
      this.amount = 1});
}
