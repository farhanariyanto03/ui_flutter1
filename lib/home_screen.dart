import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/models/doctor_model.dart';

var services = ['Vaccine', 'Surgery', 'SPA & Treatment', 'Consultation'];
var selectedService = 0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _greetings(),
              const SizedBox(height: 16),
              _card(),
              const SizedBox(height: 20),
              _search(),
              const SizedBox(
                height: 20,
              ),
              _services(),
              const SizedBox(height: 27),
              _doctors(),
            ],
          ),
        ),
      ),
    );
  }

  ListView _doctors() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => _doctor(doctors[index]),
      separatorBuilder: (context, index) => SizedBox(height: 11),
      itemCount: doctors.length,
    );
  }

  Container _doctor(DoctorModel doctorModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Color(0xFF35385A).withOpacity(.12),
              blurRadius: 30,
              offset: Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/${doctorModel.image}',
            height: 88,
            width: 103,
          ),
          const SizedBox(width: 20), // Add space between image and text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorModel.name,
                style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3F3E3F)),
              ),
              const SizedBox(height: 7),
              RichText(
                  text: TextSpan(
                      text: "Service : ${doctorModel.service.join(", ")}",
                      // children: doctorModel.service
                      //     .map((e) => TextSpan(text: e))
                      //     .toList(),
                      style: GoogleFonts.manrope(
                          fontSize: 12, color: Colors.black))),
              const SizedBox(height: 7),
              Row(
                children: [
                  const Icon(
                    FeatherIcons.mapPin,
                    size: 14,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    "${doctorModel.distance}km",
                    style:
                        GoogleFonts.manrope(fontSize: 12, color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  Text(
                    "Available For",
                    style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  SvgPicture.asset("assets/svg/cat.svg"),
                  SvgPicture.asset("assets/svg/dog.svg")
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  SizedBox _services() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: selectedService == index
                        ? Color(0xFF818AF9)
                        : Color(0XFFF6F6F6),
                    border: selectedService == index
                        ? Border.all(
                            color: const Color(0xFFF1E5E5).withOpacity(.22),
                            width: 2)
                        : null,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    services[index],
                    style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: selectedService == index
                            ? Colors.white
                            : Color(0XFF3F3E3F).withOpacity(.3)),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: services.length),
    );
  }

  Widget _search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(14)),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              FeatherIcons.search,
              color: const Color(0xFFCACACA),
            ),
            hintText: "Search",
            hintStyle: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFCACACA),
                height: 150 / 100)),
      ),
    );
  }

  AspectRatio _card() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xFF818AF9),
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background_card.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Your ",
                          style: GoogleFonts.manrope(
                              fontSize: 14,
                              color: Color(0xFFDEE1FE),
                              height: 150 / 100),
                          children: const [
                        TextSpan(
                            text: "Catrine ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800)),
                        TextSpan(text: "Will get\nvaccition "),
                        TextSpan(
                            text: "Tomorrow\nat 07.00 AM! ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800))
                      ])),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.4),
                        border: Border.all(
                            color: Colors.white.withOpacity(.12), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "See Details",
                      style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _greetings() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello, Humman",
            style: GoogleFonts.manrope(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF3F3E3F)),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FeatherIcons.shoppingBag,
                  color: const Color(0xFF818AF9),
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: Color(0xFFEF6497),
                      borderRadius: BorderRadius.circular(15 / 2)),
                  child: Center(
                      child: Text(
                    "2",
                    style: GoogleFonts.mPlus1p(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800),
                  )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
