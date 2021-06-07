import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_bloc/blocs/catalog/catalog_bloc.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
      ),
      body: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          if (state is LoadingData) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SuccessLoadData) {
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: state.banners.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      // width: MediaQuery.of(context).size.width,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: state.banners[index].image,
                      ),
                    );
                  },
                  options: CarouselOptions(),
                )
              ],
            );
          } else if (state is FailedToLoadData) {
            return Center(
              child: Text('Error Occured'),
            );
          } else {
            return Center(
              child: Text('Nothing'),
            );
          }
        },
      ),
    );
  }
}
