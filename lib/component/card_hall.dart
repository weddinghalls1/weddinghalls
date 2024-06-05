import 'package:flutter/material.dart';
import 'package:weddinghalls/model/hall_model_data.dart';
import 'package:weddinghalls/views/descriptionHalls.dart';

class CardHall extends StatefulWidget {
  final HallModel hallModel;
  const CardHall({super.key, required this.hallModel});

  @override
  State<CardHall> createState() => _CardHallState();
}

class _CardHallState extends State<CardHall> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DescriptionHalls(hallModel: widget.hallModel,),
          ),
        );
      },
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.black,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 220, 182, 227),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            boxShadow: const [
              BoxShadow(color: Colors.black),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(7),
                  topLeft: Radius.circular(7),
                ),
                child: Image.asset(
                  widget.hallModel.imageUrl,
                  height: 130,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.hallModel.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < widget.hallModel.rating
                                    ? Colors.black
                                    : Colors.grey,
                                size: 30,
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.hallModel.priceReservation}\$",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
