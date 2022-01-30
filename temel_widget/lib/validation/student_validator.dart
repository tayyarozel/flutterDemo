class StudentValidationMixin{
  String validaterFirstName(String value){
    if(value.length<2){
      return "İsim en az iki karakter olmalıdır";
    }
  }

  String validaterLastName(String value){
    if(value.length<2){
      return "İsim en az iki karakter olmalıdır";
    }
  }

  String validaterGrade(String value){
    var grade= int.parse(value);
    if(grade<0 || grade>100){
      return "0-100 arası olmalı";
    }
  }
}