import 'package:flutter/material.dart';
import 'package:pet_app/data/pet.dart';
import 'package:pet_app/featured/app/detail/layouts/detail_body.dart';
import 'package:pet_app/featured/app/detail/layouts/detail_heading.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.pet});
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            // hero image
            DetialHeading(pet: pet),
            // details
            DetailBody(pet: pet),
          ],
        ),
      ),
    );
  }
}
