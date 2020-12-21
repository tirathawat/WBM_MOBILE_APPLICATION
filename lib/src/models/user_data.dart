class UserData {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;

  UserData();

  String get getFirstName => firstName;

  set setFirstName(String firstName) => this.firstName = firstName;

  String get getLastName => lastName;

  set setLastName(String lastName) => this.lastName = lastName;

  String get getPhoneNumber => phoneNumber;

  set setPhoneNumber(String phoneNumber) => this.phoneNumber = phoneNumber;

  String get getEmail => email;

  set setEmail(String email) => this.email = email;

  Map<String, String> toJson() {
    Map<String, String> data = {
      "first_name": this.firstName,
      "last_name": this.lastName,
      "phone_number": this.phoneNumber,
      "email": this.email,
    };
    return data;
  }
}
