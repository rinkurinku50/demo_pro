
mixin Validators {
  String? validateFirstName(String name) {
    if (name
        .trim()
        .isEmpty) {
      return "Name can't be empty";
    }
    return null;
  }


  String? validateEmailForm(String? email) {
    if (email
        !.trim()
        .isEmpty) return "Email can't be empty";
    return validateEmail(email) ? null : "Enter a valid email";
  }

  validateEmail(String email) {
    String? pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email.trim())) {
      return false;
    } else {
      return true;
    }
  }




  String? validatePassword(String? password) {
    if (password
        !.trim()
        .isEmpty) {
      return "Password can't be empty";
    } else if (password
        .trim()
        .length <= 7) {
      return "Password character length must be atleast 8";
    } else {
      return null;
    }
  }






}