class user {
  final String email;
  final String password;

  user(this.email, this.password);
  factory user.fromMap(Map <String, dynamic> json){
    return user(
      json['email'],
      json['password']
    );
  }
}