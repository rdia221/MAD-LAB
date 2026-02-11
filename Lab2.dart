//Ride Booking System
//Encapsulation + Polymorphism

//Polymorphism Base Class
abstract class RideType {
  double calculateFare(double distance);
}

// Subclasses
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

//Encapsulation in Ride
class Ride {
  double _distance = 0; //_ shows private
  double _fare = 0;

  Ride(double distance) {
    setDistance(distance);
  }

  void setDistance(double distance) {
    if (distance > 0) {
      _distance = distance;
    } else {
      print(" Invalid distance! Distance must be positive.");
    }
  }

  double get distance => _distance;
  double get fare => _fare;

  void calculateFare(RideType rideType) {
    _fare = rideType.calculateFare(_distance);
  }
}

//Encapsulation in Customer
class Customer {
  String name;
  double _walletBalance;

  Customer(this.name, this._walletBalance);

  double get walletBalance => _walletBalance;

  void deductAmount(double amount) {
    _walletBalance -= amount;
  }
}

// Booking Function (Runtime Polymorphism)
void bookRide(Customer customer, Ride ride, RideType rideType) {
  ride.calculateFare(rideType);

  print("\nBooking Ride");
  print("Distance: ${ride.distance} km");
  print("Fare: Rs ${ride.fare}");

  if (customer.walletBalance >= ride.fare) {
    customer.deductAmount(ride.fare);
    print("Booking Successful!");
    print("Remaining Balance: Rs ${customer.walletBalance}");
  } else {
    print(" Booking Failed! Insufficient Balance.");
  }
}

void main() {
  Customer customer = Customer("Rida", 300);

  // Valid ride
  Ride ride1 = Ride(5);
  bookRide(customer, ride1, BikeRide()); // Polymorphism

  // Different rides
  Ride ride2 = Ride(10);
  bookRide(customer, ride2, CarRide());

  // Expensive rides
  Ride ride3 = Ride(10);
  bookRide(customer, ride3, LuxuryRide());

  // Invalid distance (Encapsulation validation)
  Ride ride4 = Ride(-5);
}
