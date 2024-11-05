import 'package:a02_cinemapedia/config/helpers/human_formats.dart';
import 'package:a02_cinemapedia/domain/entities/movie.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class MovieHorizontalScrollview extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalScrollview({
    super.key,
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextPage,
  });

  @override
  State<MovieHorizontalScrollview> createState() =>
      _MovieHorizontalScrollviewState();
}

class _MovieHorizontalScrollviewState extends State<MovieHorizontalScrollview> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(
              title: widget.title,
              subTitle: widget.subTitle,
            ),
          Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.movies.length,
                  itemBuilder: (context, index) {
                    return FadeInRight(
                        child: _Slide(movie: widget.movies[index]));
                  }))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: 170,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.posterPath,
              width: 190,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  );
                }
                return FadeIn(child: child);
              },
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        // title
        SizedBox(
          width: 170,
          child: Text(movie.title, maxLines: 2, style: textStyles.titleSmall),
        ),
        // end title
        // rating
        SizedBox(
          width: 160,
          child: Row(
            children: [
              Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
              const SizedBox(
                width: 3,
              ),
              Text('${movie.voteAverage}',
                  style: textStyles.bodyMedium
                      ?.copyWith(color: Colors.yellow.shade800)),
              const Spacer(),
              Text(HumanFormats.number(movie.popularity),
                  style: textStyles.bodySmall)

              // Text('${movie.popularity}',style: textStyles.bodySmall,  )
            ],
          ),
        )
        // end rating
      ]),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const _Title({
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
            ),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
              onPressed: () {},
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              child: Text(subTitle!),
            )
        ],
      ),
    );
  }
}
