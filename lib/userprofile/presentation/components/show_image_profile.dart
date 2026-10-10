
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/userprofile/data/models/ProfileImageModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageViewProfile extends StatefulWidget {
  final List<ProfileImageModel>? ProfileImage;
     int? photoindex;
  ImageViewProfile({required this.ProfileImage,required this.photoindex});

  @override
  State<ImageViewProfile> createState() => _ImageViewProfileState();
}

class _ImageViewProfileState extends State<ImageViewProfile> {
int index =0;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Expanded(
              child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: CachedNetworkImageProvider(
                          widget.ProfileImage![index].image ?? ''),
                      initialScale: PhotoViewComputedScale.contained * 0.8,
                      heroAttributes: PhotoViewHeroAttributes(
                          tag: widget.ProfileImage![index].id ?? 0),
                    );
                  },
                  itemCount: widget.ProfileImage?.length,
                  loadingBuilder: (context, event) =>
                      Center(
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          child: CircularProgressIndicator(
                            value: event == null
                                ? 0
                                : event.cumulativeBytesLoaded /
                                event.expectedTotalBytes!,
                          ),
                        ),
                      ),

wantKeepAlive: true,

                  onPageChanged: (c) {
                    print(c);
                    widget.photoindex =c;
                    setState(() {

                    });
                  },
                 pageController: PageController(initialPage: widget.photoindex??0),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Text('${widget.photoindex!+1}/${widget.ProfileImage?.length}',style: StyleTitleW,),
            )
          ],
        )
    );
  }
}