import 'package:flutter/material.dart';

class MostPopularCelebrities extends StatelessWidget {
  const MostPopularCelebrities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: Scrollbar(child: MostPopularCelebritiesCard()),
        ),
      ],
    );
  }
}

class MostPopularCelebritiesCard extends StatelessWidget {
  const MostPopularCelebritiesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemExtent: 145,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return MostPopularCelebritiesItem();
      },
    );
  }
}

class MostPopularCelebritiesItem extends StatelessWidget {
  const MostPopularCelebritiesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
        child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.7),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Navigator.of(context).pushNamed('/celebrities_info');
          },
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/pedro.webp'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Actor name'),
                      Text('Birthday'),
                      Text('Place of Birth'),
                      Text('Popularity'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    ));
  }
}
