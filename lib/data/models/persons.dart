class PersonModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;
  String? url;
  String? created;

  PersonModel(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.image,
      this.url,
      this.created});

  PersonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    image = json['image'];
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['species'] = this.species;
    data['type'] = this.type;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['url'] = this.url;
    data['created'] = this.created;
    return data;
  }
}