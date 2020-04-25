class ItemType {
  String id;
  String label;
  

  ItemType({this.id, this.label});

  factory ItemType.fromJson(Map<String, dynamic> json){
    return ItemType(
      id: json['id'],
      label: json['label']
    );
  }

  Map<String, dynamic> toMap() {  
    var map = <String, dynamic>{  
      'Id': id,  
      'Label': label
    };  
    return map;
  } 
   
  ItemType.fromMap(Map<String, dynamic> map) {  
    id = map['Id'];  
    label = map['Name'];
  }  
}