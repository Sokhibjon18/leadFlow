import 'package:auto_route/annotations.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lead_flow/core/di/injection.dart';
import 'package:lead_flow/data/dto/body_dto.dart';
import 'package:lead_flow/features/funnel/funnel_repository.dart';
import 'package:lead_flow/features/funnel/widgets/carousel_item.dart';
import 'package:uuid/uuid.dart';

@RoutePage()
class FunnelPage extends StatefulWidget {
  const FunnelPage({super.key, required this.bodyDTO, required this.ownerUid, required this.project});

  final BodyDTO bodyDTO;
  final String ownerUid;
  final String project;

  @override
  State<FunnelPage> createState() => _FunnelPageState();
}

class _FunnelPageState extends State<FunnelPage> {
  final FunnelRepository _repository = getIt<FunnelRepository>();
  String session = const Uuid().v4();
  final CarouselSliderController _controller = CarouselSliderController();
  int currentPage = 0;

  nextPressed(List<String> value) {
    _repository.updateFirestoreDocument(
      widget.ownerUid,
      widget.project,
      session,
      currentPage,
      value.join(','),
    );
    _controller.nextPage();
    currentPage++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 32, left: 32, top: 24),
                      child: LinearProgressIndicator(
                        color: Colors.grey.shade600,
                        backgroundColor: Colors.grey.shade300,
                        value: currentPage / widget.bodyDTO.screens.length,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Expanded(
                      child: CarouselSlider(
                        items: widget.bodyDTO.screens
                            .map((e) => CarouselItem(screen: e, nextPressed: nextPressed, appName: widget.project,))
                            .toList(),
                        carouselController: _controller,
                        options: CarouselOptions(
                          initialPage: currentPage,
                          viewportFraction: 1,
                          height: double.infinity,
                          enableInfiniteScroll: false,
                          scrollPhysics: const NeverScrollableScrollPhysics(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
