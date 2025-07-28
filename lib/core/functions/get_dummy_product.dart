
import 'package:e_commerce_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return
  ProductEntity(
    pices: 10,
    name: 'Apple',
    description: 'This is a description',
    price: 100,
    code: '1234',
    isFeatured: true,
    imageUrl:
        'https://images.unsplash.com/photo-1511485977113-f34c92461ad9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    
    reviews: const [],
  );
}

List<ProductEntity> getDummyProducts() {
  return [getDummyProduct(), getDummyProduct(), getDummyProduct()];
}
