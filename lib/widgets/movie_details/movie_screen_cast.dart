import 'package:flutter/material.dart';

class MovieScreenCast extends StatelessWidget {
  const MovieScreenCast({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              'Series Cast',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 320,
            child: Scrollbar(
              child: ListView.builder(
                itemCount: 10,
                itemExtent: 120,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.black.withValues(alpha: 0.2),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Image(
                              image: AssetImage('assets/images/person1.webp'),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 1.5,
                              ),
                              child: Text(
                                'Robert Pattinson',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 1.5,
                              ),
                              child: 
                              Text(
                                'Robert Pattinson (voice)',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 1.5,
                              ),
                              child: Text(
                                '1 episode',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: TextButton(
              onPressed: () {},
              child: Text('Full Cast & Crew', style: TextStyle(color: Colors.black),),
            ),
          ),
        ],
      ),
    );
  }
}
