import 'package:flutter/material.dart';
import 'package:kabrgy/features/appbarwidget.dart';
import 'package:kabrgy/features/navdrawerwidget.dart';
import 'package:kabrgy/themes/themes.dart';

class Socials extends StatelessWidget {
  const Socials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      drawer: NavDrawerWidget(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Say Hi to the youth!',
                style: AppTheme().appTheme.textTheme.displaySmall,
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(28, 28, 28, 28),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 36,
                                        width: 36,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/img/StoDomingo.jpg'),
                                        ),
                                      ),
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
                                  TextFormField(
                                    maxLines: null,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        hintText: "Share your impact.."),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Expanded(
                                      child: FilledButton(
                                        style: ButtonStyle(
                                          backgroundColor: WidgetStatePropertyAll(AppTheme().appTheme.colorScheme.primary)
                                        ),
                                        onPressed: () {},
                                        child: Text("Post")),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton(
                                      style: ButtonStyle(
                                        foregroundColor: WidgetStatePropertyAll(AppTheme().appTheme.colorScheme.primary)
                                      ),
                                      onPressed: () {},
                                      child: Text("Upload photos",)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: AppTheme().appTheme.colorScheme.onSecondary),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            height: 36,
                            width: 36,
                            child: Image(
                                image:
                                    AssetImage('assets/img/StoDomingo.jpg'))),
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
                    SizedBox(
                      height: 8,
                    ),
                    Text('Say something..',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            decoration: TextDecoration.underline)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/social_details');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppTheme()
                                    .appTheme
                                    .colorScheme
                                    .onSecondary),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      height: 36,
                                      width: 36,
                                      child: Image(
                                          image: AssetImage(
                                              'assets/img/StoDomingo.jpg'))),
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
                              const SizedBox(height: 8),
                               Text("LIBRE PAPRINT!",
                    style: AppTheme().appTheme.textTheme.bodyMedium),
                const SizedBox(
                  height: 8,
                ),
                Text(
                    "Magayunon madanggog na dakula ang epekto kang simple ming ginigibo. Lalo na itong may nakaulay si SK Chairperson Owen Rosco na magurang na sinabi ang pinaprint niya daa ulam na ninda. Akalaan po nindo na ang sarong page ning colored ay Php 10.00 na asin ang black and white ay Php 3.00. Sa kamahalan na kang mga gastusan ta ngunyan totoong masakit maghanap pa ning kwarta pang-eskwela. Kaya po patuloy po ang pag-tao mi ning serbisyo na ini. Dae pa man po ni mabilis ang pagproseso pero inaayos mi po pa-dikit-dikit. Next year po pwede na po magpa-barangay hall para magpa-print! This is a project subsidized by SK Chairperson Raymund Rosco of Siklab Lingkod Bikol SLB Bombon Chapter (No Government Funds were used) sa tabang kang Sangguniang Kabataan - Sto. Domingo, Bombon! #SKStoDomingoBombon #FreePrinting",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                    style: AppTheme().appTheme.textTheme.bodyMedium),
                const SizedBox(
                  height: 8,
                ),
                              const Text('Read more...',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline)),
                              const SizedBox(height: 8),
                              const Image(
                                  image: AssetImage('assets/img/image.png')),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
