import 'dart:convert';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

import 'model/item.dart';
import 'model/itemType.dart';

ui.Size screenDimension;
final primaryColor = const ui.Color(0xff14407b);
final backgroundColor = const ui.Color(0xffEAEAEA);

Item currentItem;
List<Item> itemsGlobal = new List<Item>();
List<ItemType> itemTypes = new List<ItemType>();

List<Item> itemsCommande = new List<Item>();


String itemJSON;
String itemTypeJSON;
String addressAPI = "";

// Chargé les articles depuis un JSON / API
Future<bool> loadItem() async {
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  //// TO DO : Supprimer ce bloc de codes lorsque les APIs sont disponible
  //// debut
  var responseBody = itemJSON.toString();
  List<dynamic> itemsJSON = json.decode(responseBody);
  for(var itemJSON in itemsJSON) {
    Item item = new Item.fromJson(itemJSON);
    itemsGlobal.add(item);
  }
  //// fin

  //// TO DO : À décommenter toutes les lignes en dessous lorsque les APIs sont disponibles
  // String url = '$addressAPI/item/';
  // final response = await http.get(Uri.encodeFull(url), headers: headers);

  // if (response.statusCode == 200) {
  //   var responseBody = response.body.toString();
  //   List<dynamic> itemsJSON = json.decode(responseBody);

  //   for(var itemJSON in itemsJSON) {
  //     Item item = new Item.fromJson(itemJSON);
  //     itemsGlobal.add(item);
  //   }

  //   return true;
  // } else {
  //   print('Failed to get item post');
  //   return false;
  // }
}

// Chargé les types d'article depuis un JSON / API
Future<bool> loadItemType() async {
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  // TO DO : Supprimer ce bloc de codes lorsque les APIs sont disponible
  // debut
  var responseBody = itemTypeJSON;
  List<dynamic> itemsTypeJSON = json.decode(responseBody);

  for(var itemTypeJSON in itemsTypeJSON) {
    ItemType item = new ItemType.fromJson(itemTypeJSON);
    itemTypes.add(item);
  }
  // fin

  //// TO DO : À décommenter toutes les lignes en dessous lorsque les APIs sont disponibles
  // String url = '$addressAPI/itemType/';
  // final response = await http.get(Uri.encodeFull(url), headers: headers);

  // if (response.statusCode == 200) {
  //   var responseBody = response.body.toString();
  //   List<dynamic> itemsTypeJSON = json.decode(responseBody);

  //   for(var itemTypeJSON in itemsTypeJSON) {
  //     ItemType item = new ItemType.fromJson(itemTypeJSON);
  //     itemTypes.add(item);
  //   }

  //   return true;
  // } else {
  //   print('Failed to get item type post');
  //   return false;
  // }
  return true;
}