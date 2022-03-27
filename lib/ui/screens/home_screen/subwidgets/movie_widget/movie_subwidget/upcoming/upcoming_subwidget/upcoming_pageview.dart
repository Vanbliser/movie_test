import 'package:flutter/material.dart';
import 'package:movie_test/models/movies.dart';
import 'package:movie_test/routes/route_names.dart';
import 'package:movie_test/ui/screens/detail_screen/detail_screen.dart';

class UpComingPageView extends StatelessWidget {
  final UpComingMovies snapshotData;
  final int? count;
  const UpComingPageView({Key? key, this.count = 3, required this.snapshotData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: 9 / 4.5,
        child: PageView.builder(
          itemCount:
              (snapshotData.list.isNotEmpty) ? snapshotData.list.length : 2,
          itemBuilder: (_, index) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      DetailScreeen(data: snapshotData.list[index]),
                ),
              );
              // Navigator.pushNamed(context, RouteNames.detailScreen,
              //     arguments: snapshotData.list[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0x44C4C4C4),
                image: DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500' +
                          snapshotData.list[index]['banner'],
                    ),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NoPageView extends StatelessWidget {
  const NoPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: 9 / 4.5,
        child: PageView.builder(
          itemCount: 4,
          itemBuilder: (_, index) => InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.detailScreen);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              clipBehavior: Clip.hardEdge,
              child: const Center(
                child: CircularProgressIndicator(color: Color(0xff0D0F14)),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0x44C4C4C4),
              ),
            ),
          ),
        ),
      ),
    );
  }
}