class Car {
    private(set) var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Car: Equatable {
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.name == rhs.name
    }
}
let car = Car(name: "audi")
//car.name = "BMW"
