import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/string_constants.dart';

class UsersSection extends StatelessWidget {
  const UsersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: size.longestSide * 0.25,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.white, Colors.yellow],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purple, Colors.deepPurple],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              runAlignment: WrapAlignment.spaceEvenly,
              children: AppStringConstants.kUsersList
                  .map(
                    (e) => SizedBox(
                      width: (size.width * 0.5) - 30,
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(
                          left: 0.0,
                          right: 0.0,
                        ),
                        leading: Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.orange, width: 2.5),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(
                            Icons.people_alt,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        horizontalTitleGap: 4,
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: e,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const TextSpan(
                                text: " ₹ ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.orange),
                              ),
                              TextSpan(
                                text: "${Random().nextInt(50000)}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          "${Random().nextInt(55)} "
                          "second ago",
                          style: const TextStyle(
                            color: Colors.white38,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
