import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/screens/student_add.dart';
import 'package:temel_widget/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

//kendi widgetimiz
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Merhaba İlk Uygulama";
  int not = 65;
  String Sonuc = "";

  Student selectedStudent=Student.widthId(0,"","",25);
  List<Student> students=[
    Student.widthId(1,"Tayyar","Özel",25),
    Student.widthId(2,"Ayşe","Özel",65),
    Student.widthId(3,"Halil","Özel",45)
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),

    );
  }



  //fonksiyon kullanma örnekleri-2
  void mesajGoster(BuildContext context,String Mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(Sonuc),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
              // for dongusu gibi dusun
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://roakgame.com/images/logo.png"),
                    ),
                    title: Text(students[index].firstName+ " " + students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not: " + students[index].grade.toString()+ " ["+students[index].getStatus+"]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: (){
                      //print(students[index].firstName);
                      setState(() {
                        selectedStudent=students[index];
                      });

                    },

                  );
                })),
        Text("Seçili Öğrenci: "+selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child:  ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),//boşluk oluşturma
                    Text("Yeni Öğrenci"),
                  ],
                ),
                // onPressed:dokunulduğunda
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
              ),

            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child:  ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.yellow),
                child: Row(
                    children: <Widget>[
                      Icon(Icons.update),
                      SizedBox(width: 5.0,),//boşluk oluşturma
                      Text("Güncelle"),
                    ],
                  ),
                // onPressed:dokunulduğunda
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(selectedStudent)));

                },
              ),

            ),Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child:  ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(width: 5.0),//boşluk oluşturma
                    Text("Sil"),
                  ],
                ),
                onPressed: () {

                  setState(() {
                    students.remove(selectedStudent);
                  });

                  var mesaj = "Silindi: " +selectedStudent.firstName;
                  mesajGoster(context,mesaj);
                },
              ),

            )
          ],
        ),

      ],
    );
  }

  Widget buildStatusIcon(int grade ) {
    if (grade>= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
