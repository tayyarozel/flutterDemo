class Student{
  int id;
  String firstName;
  String lastName;
  int grade;
  String _status;

  Student.widthId(int id, String firstName,String lastName,int grade)
  {
    this.id=id;
    this.firstName=firstName;
    this.lastName=lastName;
    this.grade=grade;

  }

  Student(String firstName,String lastName,int grade)
  {
    this.firstName=firstName;
    this.lastName=lastName;
    this.grade=grade;

  }

  Student.withoutInfo()
  {


  }

  //okumak
  String get getfirstName{
    return "OGR- "+this.firstName;
  }

  void set setFirstName(String value){
    this.firstName=value;
  }

  String get getStatus {
    String Sonuc="";
    if (this.grade >= 50) {
      Sonuc = "Geçti";
    } else if (this.grade >= 40) {
      Sonuc = "Bütünleme";
    } else {
      Sonuc = "Kaldı";
    }
    return Sonuc;
  }
}