import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:weddinghalls/component/card_hall.dart';
import 'package:weddinghalls/model/hall_model_data.dart';
import 'package:weddinghalls/view_model/get_halls_view_model.dart';

class NextPage extends StatefulWidget {
  final String hallType;

  const NextPage({required this.hallType});

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  List<HallModel> allHallList = [];
  List<HallModel> filteredHallList = [];



  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    HallsViewModel hallsViewModel = HallsViewModel();
    allHallList = await hallsViewModel.getHalls();

    setState(() {
      if (widget.hallType == "Closed") {
        filteredHallList =
            allHallList.where((hall) => hall.status == 0).toList();
      } else {
        filteredHallList =
            allHallList.where((hall) => hall.status == 1).toList();
      }
    });
  }

  void filterHalls(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredHallList = allHallList
            .where((hall) =>
        hall.name.toLowerCase().contains(query.toLowerCase()) &&
            (widget.hallType == "Closed"
                ? hall.status == 0
                : hall.status == 1))
            .toList();
      } else {
        filteredHallList = allHallList
            .where((hall) => widget.hallType == "Closed"
            ? hall.status == 0
            : hall.status == 1)
            .toList();
      }
    });
  }

  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFE6E6),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Halls Page',
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
              padding: const EdgeInsets.symmetric(horizontal: 100),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: SizedBox(
                height: 60,
                child: TextField(
                  onChanged: filterHalls,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      size: 50,
                      color: Colors.black,
                    ),
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                      const BorderSide(width: 3, color: Colors.black),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, mainAxisExtent: 250),
                itemCount: filteredHallList.length,
                itemBuilder: (context, index) {
                  return CardHall(
                    hallModel: filteredHallList[index],
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
