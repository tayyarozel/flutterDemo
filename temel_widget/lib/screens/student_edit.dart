import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentEdit extends StatefulWidget{
  Student selectedStudent;
  StudentEdit(Student selectedStudent){
    this.selectedStudent=selectedStudent;
  }

  @override
  State<StatefulWidget> createState() {

    return _StudentAddState(selectedStudent);
  }

}

class _StudentAddState extends State with StudentValidationMixin{
  Student selectedStudent;

  var formKey= GlobalKey<FormState>();
  _StudentAddState(Student selectedStudent){
    this.selectedStudent=selectedStudent;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Güncelle"),
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
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(labelText: "Öğrenci Adı",hintText: "Tayyar"),
      validator: validaterFirstName,
      onSaved: (String value){
        selectedStudent.firstName=value;
      },
    );
  }

  Widget buildLastNameField(){
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: InputDecoration(labelText: "Öğrenci Soyadı",hintText: "Özel"),
      validator: validaterLastName,
      onSaved: (String value){
        selectedStudent.lastName=value;
      },
    );
  }

  Widget buildGradeField(){
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Not",hintText: "65"),
      validator: validaterGrade,
      onSaved: ( value){
        selectedStudent.grade=int.parse(value);
      },
    );
  }

  Widget buildSubmitButton(){
    return ElevatedButton(
        onPressed: (){
          if(formKey.currentState.validate()){
            formKey.currentState.save();

            saveStudent();
            Navigator.pop(context);
          }
        },
        child: Text("Kaydet")
    );
  }
  void saveStudent(){
    print(selectedStudent.firstName);

  }

}