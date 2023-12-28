import 'package:favorite_places/model/place.dart';
import 'package:favorite_places/screens/map.dart';
import 'package:flutter/material.dart';

class PlacesDetailScreen extends StatelessWidget {
  const PlacesDetailScreen({super.key, required this.place});

  final Place place;

  String get locationImage {
    final lat = place.location.latitude;
    final lng = place.location.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=AIzaSyA9321tF_JHPd4OIf21MKD1OXrskb6nJOY';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(place.title),
        ),
        body: Stack(
          children: [
            Image.file(
              place.image,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MapScreen(
                            location: place.location,
                            isSelecting: false,
                          ),
                        ));
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                          locationImage,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black45,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        place.location.address,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}
