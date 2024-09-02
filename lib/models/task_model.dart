class TaskModel{

  String id;
  String title;
  bool isDone ;
  int date;

  TaskModel({
    this.id = " ",
    required this.title,
    this.isDone=false ,
    required this.date
  });
  TaskModel.fromJson(Map<String,dynamic>json): this(title: json["title"],
      date: json["date"],
      isDone: json["isDone"],
      id: json["id"]
  );
  Map<String,dynamic> toJson(){
 return{
   "title": title,
   "date": date,
   "isDone": isDone,
   "id": id,

 };
  }
}