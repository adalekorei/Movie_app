import 'package:flutter/material.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';

class Networks extends StatelessWidget {
  const Networks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 220, child: Scrollbar(child: NetworksCard())),
      ],
    );
  }
}

class NetworksCard extends StatelessWidget {
  const NetworksCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemExtent: 145,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return NetworksItem();
      },
    );
  }
}

class NetworksItem extends StatelessWidget {
  const NetworksItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          elevation: 2,
          shadowColor: Colors.black.withValues(alpha: 0.7),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              Navigator.of(context).pushNamed(MainNavigationRoutes.networksInfo);
            },
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/hbo.webp'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Networks name'),
                        Text('Headquarters'),
                        Text('Origin country'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
