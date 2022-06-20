import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/svg.dart';
import 'package:tik/utilities/constants.dart';

// importer les fichies de l'application.
import '../models/camera/main_camera_model.dart';
import 'package:tik/models/texte/write_message_text.dart';

// Home :page d'accueil

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // recuperer la taille de l'ecan
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        // le conteneur prendra 45% de la taille de l'ecarn
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: kVertMarocaine,
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                // image d'accueil
                image: AssetImage(""),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 73,
                      width: 73,
                      child: Image.asset("assets/logos/logo.png"),
                      decoration: const BoxDecoration(
                        color:Colors.white,
                        shape: BoxShape.circle,
                      ),

                      // --- logo
                      //  child: const Text(
                      //    "Tik",
                      //    style: TextStyle(
                      //      color: kVertMarocaine,
                      //      fontWeight: FontWeight.bold,
                      //      fontSize: 25.0,
                      //    ),
                      // ),
                      //child: SvgPicture.asset("assets/logos/Tik.jpeg"),
                      //child: Image.asset("assets/logos/Tik.jpeg"),
                    ),
                  ),
                  Text(
                    "Participé à la réforme de service public \n",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,

                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        // ---- Service camera
                        ServiceCard(
                          title: "Prendre photo",
                          imageSrc: "assets/images/photoreclamation.png",
                          press: () {
                            //appel la classe MainCamera() depuis le fichier main_camera_model.dart
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainCamera()));
                          },
                        ),
                        // --- service Texte
                        ServiceCard(
                          title: "Ecrire un Texte",
                          imageSrc: "assets/images/textreclamation.png",
                          press: () {
                            // appel la classe WriteMessage depuis le fichier main_message_text.dart
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WriteMessage()));
                          },
                        ),

                        // --- service Video
                        ServiceCard(
                          title: "Envoyer Vidéo",
                          imageSrc: "assets/images/textreclamation.png",
                          press: () {
                            // appel la classe makeVideo depuis le fichier main_Video.dart
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WriteMessage()));
                          },
                        ),
                        // --- service Voice
                        ServiceCard(
                          title: "Message vocale",
                          imageSrc: "assets/images/textreclamation.png",
                          press: () {
                            // appel la classe makeVideo depuis le fichier main_Voice.dart
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WriteMessage()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -- class ServiceCard pour gerer le menu des services propose par Tik---

class ServiceCard extends StatelessWidget {
  final String imageSrc; // variale pour recupere l'image
  final String title; //  variale pour recupere le text
  // variable press de type Function pour activer l 'evenement On Tap
  final Function() press;

  const ServiceCard(
      {Key? key,
      required this.imageSrc,
      required this.title,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        //padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadownColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            // --- Activer l'evenment onTap avec la variable
            // press de type function
            onTap: press,
            //----------------------------
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  // *****  recupere l'image dans imageSrc
                  Image(image: AssetImage(imageSrc)),
                  //SvgPicture.asset(imageSrc),
                  const Spacer(),
                  Text(
                    // *****  recupere le text dans title
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
