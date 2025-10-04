import 'package:animate_do/animate_do.dart';
import 'package:art_gallery/const/appExtension.dart';
import 'package:art_gallery/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

      body: Column(
        children: [
          10.vspace,
          Expanded(
            child: MasonryGridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 7,

              itemCount: exploreProducts.length,
              itemBuilder: (context, index) {
                final imageData = exploreProducts[index];

                return GestureDetector(
                  onLongPress: () {
                    openDialog(imageData, profile);
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailView(product: imageData, index: index),
                      ),
                    );
                  },
                  child: FadeIn(
                    delay: Duration(milliseconds: index * 100),
                    duration: const Duration(milliseconds: 500),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(imageData.imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void openDialog(final Product imageData, final String profile) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(12),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        
                    Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Main Image
              AspectRatio(
                aspectRatio: 1,
                child: Image.asset(imageData.imageUrl, fit: BoxFit.cover),
              ),

              // Action Row
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
