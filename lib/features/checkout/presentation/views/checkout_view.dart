import 'package:e_commerce_app/core/functions/get_user.dart';
import 'package:e_commerce_app/core/repos/order_repo/order_repo.dart';
import 'package:e_commerce_app/core/services/get_it_service.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/add_order_cubit_bloc_consumer.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  OrderInputEntity? orderEntity;

  @override
  void initState() {
    super.initState();
    final user = getUser();
    if (user != null) {
      orderEntity = OrderInputEntity(
        userEmail: user.email,
        userName: user.name,
        userPhoneNumber: user.phoneNumber,

        uId: user.uId,
        widget.cartEntity,
        shippingAddress: ShippingAddressEntity(),
      );
    } else {
      debugPrint('⚠️ getUser() رجع null - لم يتم العثور على بيانات المستخدم');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (orderEntity == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            'حدث خطأ أثناء تحميل بيانات المستخدم.\nيرجى تسجيل الدخول أولاً.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    return BlocProvider(
      create: (context) => AddOrderCubit(getIt<OrderRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: '48'.tr),
        body: Provider.value(
          value: orderEntity!,
          child: const AddOrderCubitBlocConsumer(child: CheckoutViewBody()),
        ),
      ),
    );
  }
}
