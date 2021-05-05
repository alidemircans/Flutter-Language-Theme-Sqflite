class User {
  //variables
  var _id;
  var _name;

  //getter

  get id => _id;
  get name => _name;

  //setter
  set setId(id) {
    _id = id;
  }

  set setName(name) {
    _name = name;
  }

  //constructure
  User(this._name);
  User.withID(this._id, this._name);

  toMap() => {
        'id': _id,
        'name': _name,
      };

  User.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
  }
}
