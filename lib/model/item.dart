

class Item {
  int id;
  String name;
  String description;
  List<String> images = [];
  bool isSelected = false;

  String idType;

  Item({this.id, this.name, this.description, this.images, this.idType});

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      id: json['id'] == null ? 0 : json['id'],
      name: json['name'] == null ? '' : json['name'].toString(),
      description: json['description'] == null ? '' : json['description'],
      images: json['images'] == null ? [""].toList() : json['images'].cast<String>(),
      idType: json['idType']
    );
  }


  Map<String, dynamic> toMap() {  
   var map = <String, dynamic>{  
     'Id': id,  
     'Name': name,
     'Description': description,
     'IdType': idType
   };  
   return map;
 } 
   
  Item.fromMap(Map<String, dynamic> map) {  
   id = map['Id'];  
   name = map['Name'];  
   description = map['Description'];
   idType = map['IdType'];
 }  
}