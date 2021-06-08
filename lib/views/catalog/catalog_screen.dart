import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_bloc/blocs/catalog/catalog_bloc.dart';
import 'package:food_app_bloc/models/product.dart';
import 'package:food_app_bloc/shared/style_constant.dart';
import 'package:food_app_bloc/shared/widgets/catalog_item.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CatalogBloc _catalogBloc = BlocProvider.of<CatalogBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Catalog', style: StyleConstant.bold14),
      ),
      body: BlocBuilder<CatalogBloc, CatalogState>(
        bloc: _catalogBloc,
        builder: (context, state) {
          if (state is LoadingData) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SuccessLoadData) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCarousel(state),
                SizedBox(height: 20),
                _buildCatalogList(state),
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

  Widget _buildCatalogList(SuccessLoadData state) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          childAspectRatio: .75,
          physics: BouncingScrollPhysics(),
          children: [
            for (Product product in state.products) CatalogItem(product: product)
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel(SuccessLoadData state) {
    return CarouselSlider.builder(
      itemCount: state.banners.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: state.banners[index].image,
          ),
        );
      },
      options: CarouselOptions(),
    );
  }
}
