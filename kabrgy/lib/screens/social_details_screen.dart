/* Authored by: Ashley Jan Cantor
Company: kabrgy
Project: kabrgy
Feature: [KBY-005] SK NAU Screen
Description: Screen providing the full content of the announcement card in the Home Screen.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

class SocialDetails extends StatelessWidget {
  const SocialDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    // final argument = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme().appTheme.appBarTheme.backgroundColor,
        title: IconButton(
          onPressed: () => {Navigator.pop(context, true)},
          icon: const Icon(Icons.arrow_back),
          color: AppTheme().appTheme.colorScheme.secondary,
        ),
      ),
      body: Container(
          color: AppTheme().appTheme.colorScheme.surface,
          child:Padding(
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
            child: ListView(
              children: <Widget>[
                const Row(
                  children: [
                    SizedBox(
                        height: 36,
                        width: 36,
                        child: Image(
                            image: AssetImage('assets/img/StoDomingo.jpg'))),
                    SizedBox(
                      width: 4,
                    ),
                    Text('SK Sto. Domingo',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black))
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text("LIBRE PAPRINT!",
                    style: AppTheme().appTheme.textTheme.bodyMedium),
                const SizedBox(
                  height: 8,
                ),
                Text(
                    "Magayunon madanggog na dakula ang epekto kang simple ming ginigibo. Lalo na itong may nakaulay si SK Chairperson Owen Rosco na magurang na sinabi ang pinaprint niya daa ulam na ninda. Akalaan po nindo na ang sarong page ning colored ay Php 10.00 na asin ang black and white ay Php 3.00. Sa kamahalan na kang mga gastusan ta ngunyan totoong masakit maghanap pa ning kwarta pang-eskwela. Kaya po patuloy po ang pag-tao mi ning serbisyo na ini. Dae pa man po ni mabilis ang pagproseso pero inaayos mi po pa-dikit-dikit. Next year po pwede na po magpa-barangay hall para magpa-print! This is a project subsidized by SK Chairperson Raymund Rosco of Siklab Lingkod Bikol SLB Bombon Chapter (No Government Funds were used) sa tabang kang Sangguniang Kabataan - Sto. Domingo, Bombon! #SKStoDomingoBombon #FreePrinting",
                    style: AppTheme().appTheme.textTheme.bodyMedium),
                const SizedBox(
                  height: 8,
                ),
                const Image(image: AssetImage('assets/img/image.png')),
                const Divider(),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100)),
                    labelText: 'Comments',
                  ),
                ),
                SizedBox(height: 28)
              ],
            ),
          )),
    );
  }
}
