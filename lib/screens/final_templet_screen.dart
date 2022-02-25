import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalTempletScreen extends StatefulWidget {
  String brideName;
  String groomName;
  String date;
  String place;
  String location;

  FinalTempletScreen(
      this.brideName, this.groomName, this.date, this.place, this.location);

  @override
  _FinalTempletScreenState createState() => _FinalTempletScreenState();
}

class _FinalTempletScreenState extends State<FinalTempletScreen> {
  String? brideName;
  String? groomName;
  String? date;
  String? place;
  String? location;



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.yellow.shade200,
                width: width,
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Invitation",
                      style: GoogleFonts.greatVibes(fontWeight: FontWeight.w400,fontSize: 85,color: Colors.amberAccent),
                    ),
                    Text("save the date",
                      style: GoogleFonts.gothicA1(fontWeight: FontWeight.w400,fontSize: 35,color: Colors.amberAccent,letterSpacing: 6),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.brideName,
                                style: GoogleFonts.greatVibes(fontWeight: FontWeight.w400,fontSize: 85,color: Colors.amberAccent),
                              ),
                              Text("&",style: GoogleFonts.greatVibes(fontWeight: FontWeight.w400,fontSize: 85,color: Colors.amberAccent),),
                              Text(widget.groomName,style: GoogleFonts.greatVibes(fontWeight: FontWeight.w400,fontSize: 75,color: Colors.amberAccent),),
                            ],
                          ),
                        )
                    ),
                    Text("TOGETHER WITH THIRE LOVING FAMILES",
                      style: GoogleFonts.gothicA1(fontWeight: FontWeight.w300,fontSize: 20,color: Colors.amberAccent),
                    ),
                    Text(widget.date,
                      style: GoogleFonts.gothicA1(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.amberAccent),

                    ),
                    Text(widget.location,style: GoogleFonts.gothicA1(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.amberAccent),),
                  ],
                ),
              ),
              Container(
                color: Colors.red.shade200,
                width: width,
                height: height,
              )
            ],
          ),
        ),
       /* floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Fina(brideName, groomName, date, location, place)),
                );
              },
              child: Container(
                width: width/2,
                height: height/14,
                color: Colors.brown,
                child: Center(
                  child: Text(
                    "Use Templet",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
            ),
          ],
        )*/
    );
  }
}
