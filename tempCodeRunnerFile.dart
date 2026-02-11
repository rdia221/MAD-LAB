//Ride Booking System

//Base Class (Polymorphism)

abstract class RideType {
  double calculateFare(double distance);
}

//Subclasses (Override Method)

class BikeRide extends RideType {
  @override
  double calculateFare(double distance) {
    return distance * 10; // Rs 10 per km
  }
}

class CarRide extends RideType {
  @override
  double calculateFare(double distance) {
    return distance * 20; // Rs 20 per km
  }
}

class LuxuryRide extends RideType {
  @override
  double calculateFare(double distance) {
    return distance * 40; // Rs 40 per km
  }
}

//Ride Class (Encapsulation)

class Ride {
  double _distance = 0;
  double _fare = 0;

  Ride(double distance) {
    setDistance(distance);
  }

  // Setter with validation
  void setDistance(double distance) {
    if (distance > 0) {
      _distance = distance;
    } else {
      print("Invalid distance!");
    }
  }

  // Getter
  double get distance => _distance;

  double get fare => _fare;

  //Calculate fare using polymorphism
  void calculateFare(RideType rideType) {
    _fare = rideType.calculateFare(_distance);
  }
}

//Customer Class (Encapsulation)

class Customer {
  String name;
  double _walletBalance;

  Customer(this.name, this._walletBalance);

  double get walletBalance => _walletBalance;

  void deductAmount(double amount) {
    _walletBalance -= amount;
  }
}

void bookRide(Customer customer, Ride ride, RideType rideType) {
  ride.calculateFare(rideType);

  print("\nBooking Ride...");
  print("Distance: ${ride.distance} km");
  print("Fare: Rs ${ride.fare}");

  if (customer.walletBalance >= ride.fare) {
    customer.deductAmount(ride.fare);
    print("Booking Successful!");
    print("Remaining Balance: Rs ${customer.walletBalance}");
  } else {
    print("Booking Failed! Insufficient Balance.");
  }
}

void main() {
  Customer customer = Customer("Rida", 1000);

  Ride ride1 = Ride(5);
  Ride ride2 = Ride(10);

  bookRide(customer, ride1, BikeRide());
  bookRide(customer, ride2, CarRide());
  bookRide(customer, ride1, LuxuryRide());
}
