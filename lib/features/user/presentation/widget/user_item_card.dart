import 'package:flutter/material.dart';
import '../../domain/entity/user_entity.dart';

class UserItemCard extends StatefulWidget {
  final UserEntity entity;

  const UserItemCard({
    super.key,
    required this.entity,
  });

  @override
  State<UserItemCard> createState() => _UserItemCardState();
}

class _UserItemCardState extends State<UserItemCard> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.2, 2.0),
                    blurRadius: 6.0),
              ],
              color: Colors.white),
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.entity.firstName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                widget.entity.lastName,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ));
  }
}
