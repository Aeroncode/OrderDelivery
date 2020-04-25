
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper.dart';
import '../model/item.dart';

class Summary extends StatefulWidget {
  Summary({Key key}) : super(key: key);

  @override
  _Summary createState() => _Summary();
}

class _Summary extends State<Summary> {
  Widget appBarTitle = new Image.asset('assets/logo_transp_white.png', width: 60,fit: BoxFit.contain,);
  bool isReadyToShow = false;

  @override
  void initState() {
    super.initState();

    isReadyToShow = itemsCommande.length > 0;
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    Widget sellButton = Container(
      width: screenDimension.width,
      height: 70,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(12),
        color: primaryColor,
        child: Text('Se faire livrer', style: TextStyle(color: Colors.white, fontSize: 16)),
        onPressed: () => Navigator.of(context).pushNamed('/localisation'),
      ),
    );

    // Fonction permettant de dresser la liste des items selectionné
    List<ListTile> _buildList() {
      setState(() { isReadyToShow = true; });
      return itemsCommande.length <= 0 ?
      <ListTile>[] :
      itemsCommande.map((itemMenu) => 
          ListTile(
          title: itemWidget(itemMenu),
          onTap: () {
            itemSelected(itemMenu);
          },
        )
      ).toList();
    }

    // Widget affichant l'écran d'accueil
    Widget body = Column(
      children: <Widget>[
        sellButton,
        isReadyToShow ?
        Expanded(
          child: new ListView(
            padding: new EdgeInsets.symmetric(horizontal: 1.0),
            children: _buildList(),
          )
        ) : 
        loadingState,
      ],
    );

    return Scaffold (
      key: widget.key,
      backgroundColor: Colors.white,
      appBar: buildBar(context),
      body: Container(
        height: screenDimension.height,
        width: screenDimension.width,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("assets/background.jpg"),
          //   fit: BoxFit.cover,
          // ),
          color: backgroundColor
        ),
        child: body,
      ),
    );
  }

  // Le patienteur
  Widget loadingState = Container(
    padding: new EdgeInsets.symmetric(horizontal: 40.0),
    color: Colors.white,
    child: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
      ),
    ),
  );

  // Widget pour l'affichage de chaque item de la liste des commandes
  Container itemWidget(Item item) {
      return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: item.isSelected ? primaryColor.withOpacity(0.5) : Colors.white,
          borderRadius: const BorderRadius.all(const Radius.circular(0.0)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // image
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                color: Colors.black12,
                image: DecorationImage(
                  image: new NetworkImage(item.images[0])/*new ExactAssetImage("assets/${item.images[0]}")*/,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                borderRadius: const BorderRadius.only(topRight: const Radius.circular(15.0), bottomLeft: const Radius.circular(15.0)),
              ), 
            ),
            SizedBox(width:5),
            // nom, description
            Container(
              height: 120,
              width: ((MediaQuery.of(context).size.width / 3) * 2) * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "${item.name}", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    "${item.description}", 
                    style: TextStyle(
                      fontSize: 15
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                ],
              ) 
            )
          ], 
        ),
      );
    }
 
  // Widget pour l'affichage de l'entête de la page home
  Widget buildBar(BuildContext context) {
    return new AppBar(
        centerTitle: true,
        title: appBarTitle,
        backgroundColor: primaryColor,
        elevation: 0,
    );
  }

  // Fonction s'éxécutant lorsqu'on clique sur un item pour deselectionner
  void itemSelected(Item item) {
    // currentItem = item;
    // Navigator.of(context).pushNamed('/localisation');

    setState(() {
      if (itemsCommande.where((favorite) => favorite.name == item.name).toList().length <= 0) {
        item.isSelected = true;
        itemsCommande.add(item);
      } else {
        item.isSelected = false;
        itemsCommande.removeWhere((favorites) => favorites.id == item.id);
      }
    });
  }
}