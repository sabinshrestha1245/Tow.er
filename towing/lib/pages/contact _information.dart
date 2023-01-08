import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactInformation extends StatefulWidget {
  const ContactInformation({Key? key}) : super(key: key);

  @override
  State<ContactInformation> createState() => _ContactInformationState();
}

class _ContactInformationState extends State<ContactInformation> {
  final TextEditingController text_controller = TextEditingController();
  get body => null;

  @override
  Widget build(BuildContext context) {
    const maxLines = 15;
    var size = MediaQuery.of(context).size;
    return  Scaffold(
        appBar: AppBar(
          title:  Text("Contact Information",style: GoogleFonts.lato(
              color: Colors.yellow, fontSize: 28,
              backgroundColor: Colors.blue,fontWeight: FontWeight.bold
          ),),
          leading: const BackButton(
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Center(
                      child: Text('Share your issue',textAlign: TextAlign.center, style: GoogleFonts.lato(
                        color: Colors.amber, fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      margin: const EdgeInsets.all(2.0),
                      height: maxLines * 24.0,
                      child: TextFormField(
                        controller: text_controller ,
                        maxLines: maxLines,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintText: "Enter your problem",
                          filled: true,
                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 10,),
                    Center(
                      child: ElevatedButton(
                        onPressed: (){}, child: Text(
                        "Send ",style: GoogleFonts.lato(
                        color: Colors.white,
                      ), ),),
                    ),
                    Center(
                      child: SizedBox(
                        child: Row(
                          children: [
                            Text("Contact the following branch : "
                              ,style: GoogleFonts.lato(
                                color: Colors.black87,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ) );
  }
}