
import 'package:flutter/material.dart';
import 'dart:async';

import 'home.dart';
import '../helper.dart';
import '../model/item.dart';
import '../model/itemType.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({ Key key }) : super(key: key);
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  final key = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    var description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit";

    itemTypeJSON = """[
      { "id": "00", "label": "Repas" },
      { "id": "01", "label": "Article" },
      { "id": "02", "label": "Produit "}
    ]""";

    itemJSON = """[
      { "id": 1,  "name": "Repas 1",   "idType": "00", "description": "$description", "images": ["https://www.iniaina.com/wp-content/uploads/2015/02/Les-dangers-du-fast-food-1.jpg"] },
      { "id": 2,  "name": "Repas 2",   "idType": "00", "description": "$description", "images": ["https://www.fourchette-et-bikini.fr/sites/default/files/styles/full_670x350/public/shutterstock_288575585.jpg?itok=pYajZtHt"] },
      { "id": 3,  "name": "Repas 3",   "idType": "00", "description": "$description", "images": ["https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRjEAIp042YBmokyuBxWJDdAFuEQc_DxY1eVsy-s48Avh5Igueo&usqp=CAU"] },
      { "id": 4,  "name": "Article 1", "idType": "01", "description": "$description", "images": ["https://www.la-viande.fr/sites/default/files/article/ckeditor/quelle_poele_choisir_.jpg"] },
      { "id": 5,  "name": "Article 2", "idType": "01", "description": "$description", "images": ["https://www.la-viande.fr/sites/default/files/article/ckeditor/poele_en_fonte.jpg"] },
      { "id": 6,  "name": "Produit 1", "idType": "02", "description": "$description", "images": ["https://www.bioalaune.com/img/article/37262-tomate-aliment-miracle-prevenir-cancer.png"] },
      { "id": 7,  "name": "Produit 2", "idType": "02", "description": "$description", "images": ["https://oceans-news.com/wp-content/uploads/legume-concombre-vert.jpg"] },
      { "id": 8,  "name": "Repas 4",   "idType": "00", "description": "$description", "images": ["https://www.iniaina.com/wp-content/uploads/2015/02/Les-dangers-du-fast-food-1.jpg"] },
      { "id": 9,  "name": "Article 3", "idType": "01", "description": "$description", "images": ["https://www.cuisineaddict.com/blog/wp-content/uploads/2019/11/FONDPIXEL-1-1080x580.jpg"] },
      { "id": 10, "name": "Produit 3", "idType": "02", "description": "$description", "images": ["https://assets.afcdn.com/story/20190220/1334066_w980h638c1cx2464cy1632cxt1084cyt0cxb4287cyb2983.jpg"] }
    ]""";


    loadItem();
    loadItemType();

    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    screenDimension = MediaQuery.of(context).size;

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    screenDimension = MediaQuery.of(context).size;
    
    final wall = Container(
      child: Image.asset('assets/logo_transp_blue.png', width: screenDimension.width - 200, fit: BoxFit.cover,),
    );

    return Scaffold(
      key: key,
      backgroundColor: backgroundColor,
      body: Center(
        child: wall,
      )
    );
  }
}