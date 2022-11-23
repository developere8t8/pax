class CategoryData {
  String? id;
  String? name;
  String? thumbnail;
  bool? active;

  CategoryData({required this.active, required this.id, required this.name, required this.thumbnail});

  CategoryData.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    thumbnail = map['thumbnail'];
    active = map['active'];
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'thumbnail': thumbnail, 'active': active};
  }
}
