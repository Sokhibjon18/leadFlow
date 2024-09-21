import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class PagesView extends StatefulWidget {
  const PagesView({super.key});

  @override
  State<PagesView> createState() => _PagesViewState();
}

class _PagesViewState extends State<PagesView> {
  int pagesCount = 1;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            shrinkWrap: true,
            itemCount: pagesCount,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 12);
            },
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        pagesCount--;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: const Icon(Icons.remove, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        height: 100,
                        width: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0E0E0),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: selectedIndex == index
                                ? const Color(0xFF4CAF50)
                                : const Color(0xFFE0E0E0),
                            width: 1.7,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '$index',
                            style: const TextStyle(
                              color: Color(0xFF424242),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              pagesCount++;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DottedBorder(
              color: const Color(0xFFCED0D3),
              strokeWidth: 1,
              dashPattern: const [12],
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              padding: const EdgeInsets.all(16),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Center(child: Icon(Icons.add, color: Color(0xFFCED0D3))),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
