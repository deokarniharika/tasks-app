class TodoField{
  static const createdTime= 'createdTime';
}
//model object, comtains whether its completed or not, and its title and description
class Todo{
DateTime createdTime;
String title;
String id;
String description;
bool isDone;

Todo({
  required this.createdTime,
  required this.title,
  this.description='',
  this.id='',
  this.isDone=false,
});

}