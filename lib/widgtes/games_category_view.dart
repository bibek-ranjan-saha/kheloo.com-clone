import 'dart:math';

import 'package:flutter/material.dart';
import 'package:the_technology_maker/utils/double_utils.dart';

import 'asset_image_view.dart';

class GamesCategory extends StatefulWidget {
  final String title;
  final int count;

  const GamesCategory({Key? key, required this.title, required this.count})
      : super(key: key);

  @override
  State<GamesCategory> createState() => _GamesCategoryState();
}

class _GamesCategoryState extends State<GamesCategory> {
  int currentViewingCount = 4;
  bool showingMore = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          Row(
            children: [
              14.0.padding(),
              Container(
                height: 42,
                width: 8,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "${widget.title} (${widget.count})",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (showingMore) {
                    currentViewingCount = 4;
                  } else {
                    currentViewingCount = widget.count;
                  }
                  setState(() {
                    showingMore = !showingMore;
                  });
                },
                child: Text(
                  showingMore ? "Show More" : "Show Less",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          12.0.padding(),
          SizedBox(
            height: (size.width * 0.5) * (currentViewingCount / 2),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: List.generate(
                currentViewingCount,
                (index) => Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: (size.width * 0.5) - 30,
                    width: (size.width * 0.5) - 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow, width: 2.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: AppImageView(
                            fileName:
                                "https://picsum.photos/id/${Random().nextInt(500)}/200/300",
                          ),
                        ),
                        Container(
                          height: (size.width * 0.08),
                          decoration: const BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
