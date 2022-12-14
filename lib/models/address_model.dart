class AddressModel {
  late int id;
  late String addressType;
  late String address;
  late String city;
  late String floorDetails;
  late String country;
  late String streetName;
  late String streetDetails;
  late int floorNumber;

  AddressModel(
      this.id,
        this.addressType,
        this.address,
        this.city,
        this.floorDetails,
        this.country,
        this.streetName,
        this.streetDetails,
        this.floorNumber);

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    addressType = json['address_type'];
    address = json['address'];
    city = json['city'];
    floorDetails = json['floor_details'];
    country = json['country'];
    streetName = json['street_name'];
    streetDetails = json['street_details'];
    floorNumber = json['floor_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address_type'] = addressType;
    data['address'] = address;
    data['floor_details'] = floorDetails;
    data['country'] = country;
    data['street_name'] = streetName;
    data['street_details'] = streetDetails;
    data['floor_number'] = floorNumber;
    return data;
  }
}
