import 'package:app_fox_movies/pages/movie_info_page/movie_info_page_store.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@RoutePage()
class MovieInfoPage extends StatefulWidget {
  final int movieId;
  final int movieIndex;

  const MovieInfoPage({
    Key? key,
    required this.movieId,
    required this.movieIndex,
  }) : super(key: key);

  @override
  State<MovieInfoPage> createState() => _MovieInfoPageState();
}

class _MovieInfoPageState extends State<MovieInfoPage> {
  late final MovieInfoPageStore store;

  @override
  void initState() {
    store = MovieInfoPageStore(
      GetIt.I(),
      widget.movieId,
      widget.movieIndex,
    );
    store.loadMovie();
    super.initState();
  }

  @override
  void deactivate() {
    if (store.trailerController != null) {
      store.trailerController!.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    if (store.trailerController != null) {
      store.trailerController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0C0B),
      body: SafeArea(
        child: Observer(
          builder: (context) {
            if (store.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return SingleChildScrollView(
              child: store.movieModel != null
                  ? Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 220,
                              decoration: BoxDecoration(
                                image: store.movieModel!.backdrop.previewUrl !=
                                        null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          store
                                              .movieModel!.backdrop.previewUrl!,
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                            ),
                            Positioned(
                              left: 16,
                              top: 16,
                              child: GestureDetector(
                                onTap: () {
                                  context.router.back();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Color(0xff545454),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_ios_outlined,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 6,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    store.movieModel!.name ?? '',
                                    maxLines: 4,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '(${store.movieModel!.year.toString()})',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellowAccent,
                                        size: 16,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        store.movieModel!.rating?.kp
                                                ?.toStringAsFixed(1) ??
                                            '',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          color: Color(0xffDF3D0F),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.thumb_up,
                                          color: Color(0xff0A0C0B),
                                          size: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      store.movieModel!.votes?.kp != null
                                          ? Text(
                                              store.movieModel!.votes?.kp
                                                      ?.toStringAsFixed(0) ??
                                                  '',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 4,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      '${store.movieModel!.ageRating}+',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff0A0C0B),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              GestureDetector(
                                onTap: () {
                                  store.addToFavourite();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff545454),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        store.isFavourite
                                            ? const SizedBox()
                                            : const Icon(
                                                Icons
                                                    .create_new_folder_outlined,
                                                color: Colors.white,
                                              ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          store.isFavourite
                                              ? 'Добавлено'
                                              : 'Добавить в избранное',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Описание',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    store.movieModel!.description ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff545454),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Wrap(
                                runSpacing: 8.0,
                                spacing: 8.0,
                                children: <Widget>[
                                  for (var genre in store.movieModel!.genres)
                                    Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: 120,
                                      ),
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: const Color(0xff545454),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          genre.name,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Каст',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          store.movieModel!.persons.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.only(
                                            right: 12,
                                          ),
                                          width: 100,
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: store
                                                            .movieModel!
                                                            .persons[index]
                                                            .photo !=
                                                        null
                                                    ? NetworkImage(
                                                        store
                                                            .movieModel!
                                                            .persons[index]
                                                            .photo!,
                                                      )
                                                    : Image.asset(
                                                        'assets/images/no_poster.png',
                                                      ).image,
                                                radius: 35,
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                store.movieModel!.persons[index]
                                                        .name ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Сборы в мире: ${store.movieModel!.fees.world.value ?? ''} ${store.movieModel!.fees.world.currency ?? ''}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              store.movieModel!.premiere.world != null
                                  ? Text(
                                      'Премьера в мире: ${DateFormat(
                                        'dd.MM.yyyy',
                                      ).format(
                                        DateTime.parse(
                                          store.movieModel!.premiere.world!,
                                        ),
                                      )}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  : const SizedBox(),
                              const SizedBox(
                                height: 32,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Трейлер',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  store.trailerController != null
                                      ? YoutubePlayer(
                                          controller: store.trailerController!,
                                          showVideoProgressIndicator: true,
                                          progressIndicatorColor:
                                              const Color(0xffDF3D0F),
                                          progressColors:
                                              const ProgressBarColors(
                                            playedColor: Color(0xffDF3D0F),
                                            handleColor: Color(0xffDF3D0F),
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
