import 'package:animate_do/animate_do.dart';
import 'package:art_gallery/const/appExtension.dart';
import 'package:art_gallery/const/const.dart';
import 'package:art_gallery/const/text_style.dart';
import 'package:art_gallery/model/productmodel.dart';
import 'package:art_gallery/widget/app_gradient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailView extends StatelessWidget {
  final Product product;
  final int index;
  const DetailView({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradient(
        child: CustomScrollView(
          slivers: [
            /// Top Image with SliverAppBar (full flexible height)
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 60.h, // Flexible height (device based)
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: product.name,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(product.imageUrl, fit: BoxFit.cover),
                      Positioned(
                        top: 40,
                        left: 10,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            IconlyBold.arrow_left,
                            color: Colors.black,
                            size: 25.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 45,
                        right: 20,
                        child: Row(
                          children: [
                            Text(
                              'Popular # ${index + 1}',
                              style: headingStyle(
                                context,
                              ).copyWith(color: Colors.black, fontSize: 18.sp),
                            ),
                            10.hspace,
                            const Icon(
                              CupertinoIcons.star_fill,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Content section (scrollable full screen)
            SliverToBoxAdapter(
              child: Padding(
                padding: kPagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.vspace,
                    Row(
                      children: [
                        FadeInDown(
                          delay: const Duration(milliseconds: 500),
                          from: 30,
                          curve: Curves.easeInOut,
                          child: Text(
                            product.name,
                            style: headingStyle(
                              context,
                            ).copyWith(fontSize: 20.sp),
                          ),
                        ),
                        const Spacer(),
                        for (int i = 0; i < randomImages.length; i++)
                          Align(
                            widthFactor: 0.8,
                            child: CircleAvatar(
                              radius: 15.sp,
                              child: FadeInDown(
                                delay: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                from: 30,
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                    randomImages[i],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    10.vspace,
                    FadeInDown(
                      delay: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      from: 30,
                      child: Text(
                        'Vintage Art',
                        style: GoogleFonts.poppins(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    10.vspace,
                    FadeInDown(
                      delay: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                      child: Text(
                        description,
                        style: subtitleStyle(
                          context,
                        ).copyWith(color: Colors.amber[50]),
                      ),
                    ),
                    15.vspace,
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: FadeIn(
                        delay: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        child: CircleAvatar(
                          radius: 20.sp,
                          backgroundImage: const NetworkImage(profile),
                        ),
                      ),
                      title: FadeInDown(
                        delay: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        from: 20,
                        child: Text(
                          'Mike Zungiya',
                          style: headingStyle(
                            context,
                          ).copyWith(fontSize: 18.sp, color: Colors.white),
                        ),
                      ),
                      subtitle: FadeInDown(
                        delay: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        from: 20,
                        child: Text(
                          '@art_Mike',
                          style: subtitleStyle(
                            context,
                          ).copyWith(color: Colors.white70, fontSize: 16.sp),
                        ),
                      ),
                      trailing: FadeInRightBig(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            '+ Friend',
                            style: subtitleStyle(
                              context,
                            ).copyWith(color: Colors.amber[50]),
                          ),
                        ),
                      ),
                    ),
                    20.vspace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Bid Price',
                              style: subtitleStyle(context).copyWith(
                                color: Colors.amber[50]!.withOpacity(.5),
                              ),
                            ),
                            Text(
                              product.price,
                              style: subtitleStyle(context).copyWith(
                                color: Colors.orange[100],
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                        FadeInUp(
                          delay: const Duration(milliseconds: 500),
                          child: MaterialButton(
                            height: 5.h,
                            minWidth: 50.w,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.orange[100],
                            onPressed: () {},
                            child: Text(
                              'Bid Now',
                              style: subtitleStyle(context).copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    50.vspace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
