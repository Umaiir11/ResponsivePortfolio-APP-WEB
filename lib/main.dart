import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolio/utils.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:portfolio_app/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

Widget iconButton(icon){
  return IconButton(
    icon: FaIcon(icon,color: Colors.grey,size: 20,),
    onPressed: (){},
  );
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   Utils _utils = Utils();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 0),
            child:Image.asset('images/black.jpg'),

          ),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [.5, .6],
                    colors: [Colors.transparent, Colors.black])),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              child: Column(
                children: [
                  Text('Hello I am',
                      style:
                      GoogleFonts.acme(color: Colors.white, fontSize: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Umair Hashmi',
                      style: GoogleFonts.almendra(
                          color: Colors.white, fontSize: 40)),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Application Developer - (Android & IOS)',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),),
                    onPressed: () {
                      launchUrl(
                          Uri.parse('https://iammuhammadumairr.web.app/'));

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: Text('Hire Me',style: GoogleFonts.cutiveMono(color: Colors.black87,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey,),),
                  InkWell(
                      onTap: () => launchUrl(
                          Uri.parse('https://www.facebook.com/iam.umairrr')),
                      child: iconButton(FontAwesomeIcons.facebook)),
                  InkWell(
                      onTap: () => launchUrl(
                          Uri.parse('https://github.com/Umaiir11')),
                      child: iconButton(FontAwesomeIcons.github)),
                  InkWell(
                      onTap: () => launchUrl(
                          Uri.parse('https://www.instagram.com/umair.hashmiii/')),
                      child: iconButton(FontAwesomeIcons.instagram)),
                  InkWell(
                      onTap: () async {
                        var whatsapp = "+923184431218";
                        Uri whatsappopen =
                        Uri.parse("whatsapp://send?phone=$whatsapp");
                        if (await launchUrl(whatsappopen)) {
                          //dialer opened
                        } else {
                          //dailer is not opened
                        }
                      },
                      child: iconButton(FontAwesomeIcons.whatsapp)),
                  Expanded(child: Divider(color: Colors.grey,),),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              color: Colors.white,
              child: IconButton(
                icon: FaIcon(FontAwesomeIcons.gripLines,color: Colors.black,),
                onPressed: (){
                  _utils.showBottomSheet(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
