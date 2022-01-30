import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentAdd extends StatefulWidget{
  List <Student> students;
  StudentAdd(List<Student> students){
    this.students=students;
  }

  @override
  State<StatefulWidget> createState() {
  
    return _StudentAddState(students);
  }

}

class _StudentAddState extends State with StudentValidationMixin{
  List <Student> students;
  var student =Student.withoutInfo();
  var formKey= GlobalKey<FormState>();
  _StudentAddState(List<Student> students){
    this.students=students;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı",hintText: "Tayyar"),
      validator: validaterFirstName,
      onSaved: (String value){
        student.firstName=value;
      },
    );
  }

  Widget buildLastNameField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Soyadı",hintText: "Özel"),
      validator: validaterLastName,
      onSaved: (String value){
        student.lastName=value;
      },
    );
  }

  Widget buildGradeField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Not",hintText: "65"),
      validator: validaterGrade,
      onSaved: ( value){
        student.grade=int.parse(value);
      },
    );
  }

  Widget buildSubmitButton(){
    return ElevatedButton(
        onPressed: (){
          if(formKey.currentState.validate()){
            formKey.currentState.save();
            students.add(student);
            saveStudent();
            Navigator.pop(context);
          }
        },
        child: Text("Kaydet")
    );
  }
  void saveStudent(){
    print(student.firstName);

  }
  
}