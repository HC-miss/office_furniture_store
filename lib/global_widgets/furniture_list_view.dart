import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:office_furniture_store/core/extensions/string.dart';
import 'package:office_furniture_store/core/extensions/widget.dart';
import 'package:office_furniture_store/core/values/app_style.dart';
import 'package:office_furniture_store/data/model/furniture.dart';
import 'package:office_furniture_store/global_widgets/rating_bar.dart';

class FurnitureListView extends StatelessWidget {
  final bool isHorizontal;
  final Function(Furniture furniture)? onTap;
  final List<Furniture> furnitureList;

  const FurnitureListView({
    super.key,
    this.isHorizontal = true,
    this.onTap,
    required this.furnitureList,
  });

  Widget _furnitureScore(Furniture furniture) {
    return Row(
      children: [
        StarRatingBar(score: furniture.score),
        const SizedBox(width: 10),
        Text(furniture.score.toString(), style: h4Style),
      ],
    ).fadeAnimation(1.0);
  }

  Widget _furnitureImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(image, width: 150, height: 150),
    ).fadeAnimation(0.4);
  }

  Widget _listViewItem(Furniture furniture, int index) {
    Widget widget;

    if (isHorizontal) {
      widget = Column(
        children: [
          // todo 解决hero返回时组件重构的问题 重构会导致动画重新执行
          Hero(
            tag: furniture.title,
            // tag: "hero:${furniture.title}",
            child: _furnitureImage(furniture.images[0]),
          ),
          const SizedBox(height: 10),
          Text(
            furniture.title.addOverFlow,
            style: h4Style,
          ).fadeAnimation(0.8),
        ],
      );
    } else {
      widget = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Q: 此处为什么会启动hero动画
          // A: 因为两个页面有关联的Hero
          _furnitureImage(furniture.images[0]),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(furniture.title, style: h4Style).fadeAnimation(0.8),
                  const SizedBox(height: 5),
                  _furnitureScore(furniture),
                  const SizedBox(height: 5),
                  Text(
                    furniture.description,
                    style: h5Style.copyWith(fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ).fadeAnimation(1.4)
                ],
              ),
            ),
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: () => onTap?.call(furniture),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isHorizontal) {
      return SizedBox(
        height: 200,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            Furniture furniture = furnitureList[index];
            return _listViewItem(furniture, index);
          },
          separatorBuilder: (_, __) {
            return const SizedBox(width: 15);
          },
          itemCount: furnitureList.length,
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      reverse: true,
      physics: const ClampingScrollPhysics(),
      itemCount: furnitureList.length,
      itemBuilder: (_, index) {
        Furniture furniture = furnitureList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 10),
          child: _listViewItem(furniture, index),
        );
      },
    );
  }
}
