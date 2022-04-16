import 'package:flutter/material.dart';
import '../models/models.dart';

class RecipeThumbnail extends StatefulWidget {
  final SimpleRecipe recipe;

  const RecipeThumbnail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<RecipeThumbnail> createState() => _RecipeThumbnailState();
}

class _RecipeThumbnailState extends State<RecipeThumbnail> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              child: Image.asset(
                '${widget.recipe.dishImage}',
                fit: BoxFit.cover,
                height: 605,
                width: 605,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.recipe.title,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        widget.recipe.duration,
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  )
                ],
              ),
              IconButton(
                icon:
                Icon(_isFavorited ? Icons.star_outlined : Icons.star_outline),
                iconSize: 30,
                color: Colors.amber,
                onPressed: () {
                  setState(() {
                    _isFavorited = !_isFavorited;
                  });
                },
              )
            ],
          )


          /*Text(
            recipe.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            recipe.duration,
            style: Theme.of(context).textTheme.bodyText1,
          )*/
        ],
      ),
    );
  }
}
