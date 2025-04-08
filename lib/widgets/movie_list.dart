import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemExtent: 165,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Stack(
            children: [
              Container(
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
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: [
                    Image(image: AssetImage('assets/images/mikki.jpeg')),
                    SizedBox(width: 10),
                    Expanded(
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Mikki 17',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2),
                          Text('April 8, 2025'),
                          SizedBox(height: 20),
                          Text(
                            'Mickey 17 is a 2025 science fiction black comedy film written, produced, and directed by Bong Joon Ho, based on the 2022 novel Mickey7 by Edward Ashton. The film stars Robert Pattinson in the title role, alongside Naomi Ackie, Steven Yeun, Toni Collette, and Mark Ruffalo. Set in the year 2054, the plot follows a man who joins a space colony as an "Expendable", a disposable worker who gets cloned every time he dies for research purposes.',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              Material(color: Colors.transparent, child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {})),
            ],
          ),
        );
      },
    );
  }
}
