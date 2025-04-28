import 'package:flutter/material.dart';

class Trailers extends StatelessWidget {
  const Trailers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 280, child: Scrollbar(child: (TrailersCard()))),
      ],
    );
  }
}

class TrailersCard extends StatelessWidget {
  const TrailersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemExtent: 370,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return TrailersItem();
      },
    );
  }
}

class TrailersItem extends StatelessWidget {
  const TrailersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: InkWell(
        onTap: () {},
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black.withValues(alpha: 0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Stack(
              children: [
                Image.asset('assets/images/sun.webp'),
                Positioned(
                  bottom: 20,
                  width: 140,
                  height: 140,
                  child: Image.asset('assets/images/conclave.webp'),
                ),
                Positioned(
                  bottom: 28,
                  left: 130,
                  child: Column(
                    children: [Text('Film name'), Text('Watch the Trailer')],
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 130,
                  child: Row(
                    children: [
                      Icon(Icons.thumb_up, size: 17),
                      SizedBox(width: 5),
                      Text('Vote count'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
