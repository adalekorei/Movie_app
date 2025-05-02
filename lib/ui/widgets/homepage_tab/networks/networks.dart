import 'package:flutter/material.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';

class Networks extends StatelessWidget {
  const Networks({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      child: Scrollbar(
        child: ListView.builder(
          itemCount: 20,
          itemExtent: 145,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(6),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                elevation: 2,
                shadowColor: Colors.black.withValues(alpha: 2),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed(MainNavigationRoutes.networksInfo);
                  },
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/hbo.webp'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
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
            );
          },
        ),
      ),
    );
  }
}
