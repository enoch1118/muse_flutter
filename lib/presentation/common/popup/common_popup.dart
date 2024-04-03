import 'package:flutter/material.dart';
import 'package:muse_flutter/core/asset/image_mapper.dart';
import 'package:muse_flutter/core/extensions/extensions.dart';
import 'package:muse_flutter/presentation/common/gesture/tap.dart';

enum PopupResult { ok, cancel }

class CommonPopup extends StatelessWidget {
  static Future<PopupResult?> show(
    BuildContext context,
    ImageMapper image, {
    String? title,
    String? desc,
  }) {
    return showDialog<PopupResult>(
      context: context,
      builder: (context) => CommonPopup(
        image: image,
        title: title,
        desc: desc,
      ),
    );
  }

  const CommonPopup({super.key, required this.image, this.title, this.desc});
  final ImageMapper image;
  final String? title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: LayoutBuilder(builder: (context, cons) {
            return Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                Positioned.fill(
                    child: XDecoImage(
                  image,
                  fit: BoxFit.cover,
                  filter:
                      const ColorFilter.mode(Colors.black12, BlendMode.darken),
                )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: cons.maxHeight / 2,
                    child: Container(
                      color: Colors.white.withOpacity(1),
                      child: Column(
                        children: [
                          const SB().h(20),
                          TC(title ?? "Connect Error",
                              context.t.titleLarge.wb.c(Colors.redAccent)),
                          const SB().h(12),
                          TC(desc ?? "Please check your network and try again",
                              context.t.bodyMedium.c(Colors.black54)),
                          const XFlex(1),
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Tap(
                                child: T(
                                    "OK", context.t.bodyMedium.c(Colors.blue)),
                                onPressed: () {
                                  Navigator.pop(context, PopupResult.ok);
                                }),
                          ).end
                        ],
                      ),
                    ))
              ],
            );
          }),
        ),
      ),
    );
  }
}
