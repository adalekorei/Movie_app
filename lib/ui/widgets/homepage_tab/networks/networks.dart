import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/ui/widgets/homepage_tab/networks/networks_model.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';

class Networks extends StatelessWidget {
  const Networks({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<NetworksModel>(context);
    if (model == null) return SizedBox.shrink();
    return SizedBox(
      height: 235,
      child: Scrollbar(
        child: ListView.builder(
          itemCount: model.networks.length,
          itemExtent: 135,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final networks = model.networks[index];
            final logoPath = networks.logoPath;
            return Padding(
              padding: const EdgeInsets.all(6),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                elevation: 2,
                shadowColor: Colors.black.withValues(alpha: 2),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        logoPath != null
                            ? Center(
                              child: Image.network(
                                ApiClient.imageUrl(logoPath),
                                width: 115,
                                height: 135,
                                fit: BoxFit.fitWidth,
                              ),
                            )
                            : Image.asset(
                              'assets/images/images.png',
                              width: 125,
                              fit: BoxFit.fitWidth,
                              height: 185,
                            ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(networks.name),
                              Text(networks.headquarters),
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
