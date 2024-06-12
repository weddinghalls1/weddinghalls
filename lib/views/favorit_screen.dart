import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weddinghalls/component/card_hall.dart';
import 'package:weddinghalls/model/hall_model_data.dart';
import 'package:weddinghalls/model/hall_model_favorite_data.dart';
import 'package:weddinghalls/view_model/get_halls_view_model.dart';
import 'package:weddinghalls/views/descriptionHalls.dart';
import 'package:weddinghalls/views/sidbar.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({super.key});

  @override
  State<FavoritScreen> createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  List<HallFavorite> hallList = [];

  getData() async {
    HallsViewModel hallsViewModel = HallsViewModel();
    hallList = await hallsViewModel
        .getFavoriteHalls("12345"); //  FirebaseAuth.instance.currentUser.uid

    print(hallList.length);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFE6E6),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Favorit Page',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color(0xffFFE6E6),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_isVisible)
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 3,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'images/open.jpeg',
                              height: 130,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -11,
                          right: -11,
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              size: 40,
                            ),
                            color: Colors.red,
                            onPressed: () {
                              setState(() {
                                _isVisible = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 210,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 60),
                itemCount: hallList.length,
                itemBuilder: (context, index) {
                  return buildFavoritCard(
                      hallList[index].name, hallList[index].imageUrl, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildFavoritCard(String name, String image, BuildContext context) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DescriptionHalls(),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Colors.black,
              width: 0,
            ),
            boxShadow: const [
              BoxShadow(color: Colors.black),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.black,
              child: Image.asset(
                image,
                fit: BoxFit.fill, // Ensure the image fills the available space
                width: double.infinity,
                height: 130,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
