class Customer {
  int? id;
  String? name;
  String? email;
  int? age;

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    age = json['age'];
  }
}
