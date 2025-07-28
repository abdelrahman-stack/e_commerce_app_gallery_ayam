class ShippingAddressEntity {
   String? name;
   String? address;
   String? city;
   String? addressDetails;
   String? phone;
   String? email;

  ShippingAddressEntity({
     this.name,
     this.address,
     this.city,
     this.addressDetails,
     this.phone,
     this.email,
  });
  @override
  String toString() {
    return '$address, $addressDetails ,$city';
  }
}
