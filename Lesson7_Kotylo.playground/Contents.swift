import UIKit
import Foundation
// MARK: -1. Разработка иерархии классов для геометрических фигур:

//•  Создайте базовый класс Shape с общими свойствами (например, цвет) и методом calculateArea().
//•  Создайте подклассы Circle, Rectangle, Triangle, наследующиеся от Shape.
//•  Переопределите метод calculateArea() в каждом подклассе для вычисления площади соответствующей фигуры.
//•  Добавьте свойства, специфичные для каждой фигуры (например, радиус для круга, длина и ширина для прямоугольника).
//•  Создайте массив объектов типа Shape и выведите площадь каждой фигуры.
class Shape {
    
    var nameShape: String {
        return String(describing: type(of: self))
    }

    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func calculateArea() -> Double {
       fatalError("Subclasses must implement calculateArea()")
    }
    
    func printArea() {
        print("shape - \(nameShape): area = \(String(format: "%.2f", calculateArea())) мм2. Color: \(color)")
    }
}

final class Circle: Shape {
    var radius: Double
    
    init(radius: Double, color: String) {
        self.radius = radius
        super.init(color: color)
    }
    
    override func calculateArea() -> Double {
        return .pi * radius * radius
    }
}
class Square: Shape {
    var side: Double
    
    init(side: Double, color: String) {
        self.side = side
        super.init(color: color)
    }
    
    override func calculateArea() -> Double {
        return side * side
    }
}

final class Rectangle: Square {
    var height: Double
    
    init(height: Double, side: Double, color: String) {
        self.height = height
        super.init(side: side, color: color)
    }
    
    override func calculateArea() -> Double {
        return side * height
    }
}

final class Triangle: Shape {
    var base: Double
    var height: Double
    
    init(base: Double, height: Double, color: String) {
        self.base = base
        self.height = height
        super.init(color: color)
    }
    
    override func calculateArea() -> Double {
        return 0.5 * base * height
    }
}

// MARK: -Test

func randomData () -> Double { Double.random(in: 0...10) }

var shapes: [Shape] = []

shapes.append(Circle(radius: randomData(), color: "blue"))
shapes.append(Square(side: randomData(), color: "yellow"))
shapes.append(Rectangle(height: randomData(), side: randomData(), color: "green"))
shapes.append(Triangle(base: randomData(), height: randomData(), color: "red"))

shapes.forEach { $0.printArea() }


// MARK: -2. Создание структуры для представления контакта в телефонной книге:

 // •  Создайте структуру Contact со свойствами:
 //   *  firstName (String)
 //   *  lastName (String)
 //   *  phoneNumber (String)
 //   *  email (String?) (опциональный email).
 // •  Создайте функцию, которая принимает массив структур Contact и строку для поиска. Функция должна возвращать новый массив Contact, содержащий только те контакты, у которых имя или фамилия содержат строку для поиска (без учета регистра).

struct Contact {
    let firstName: String
    let lastName: String
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    let phoneNumber: String
    var email: String? {
        "\(firstName)\(lastName)@gmail.com"
    }
    
    static func search(name: String, phoneDirectory: [Contact]) -> [Contact] {
        phoneDirectory.filter { $0.fullName.lowercased().contains(name.lowercased()) }
    }
}

//MARK: -Test

var phoneDirectory: [Contact] = []

phoneDirectory.append(Contact(firstName: "Kirill", lastName: "Kotylo", phoneNumber: "+375330000001"))
phoneDirectory.append(Contact(firstName: "Dmitriy", lastName: "Kotov", phoneNumber: "+375330000002"))
phoneDirectory.append(Contact(firstName: "Vlad", lastName: "Ivanov", phoneNumber: "+375330000003"))
phoneDirectory.append(Contact(firstName: "Egor", lastName: "Makarov", phoneNumber: "+375330000004"))
phoneDirectory.append(Contact(firstName: "Vasiliy", lastName: "Petrov", phoneNumber: "+375330000005"))
phoneDirectory.append(Contact(firstName: "Evgeniy", lastName: "Petrov", phoneNumber: "+375330000006"))
phoneDirectory.append(Contact(firstName: "", lastName: "", phoneNumber: "+375330000007"))

print("\nSearch result for name \"oV\":")
Contact.search(name: "oV", phoneDirectory: phoneDirectory).forEach { print("\($0.fullName) - \($0.phoneNumber) - \($0.email ?? "No email")") }
print("\nSearch result for name \"KOT\":")
Contact.search(name: "KOT", phoneDirectory: phoneDirectory).forEach { print("\($0.fullName) - \($0.phoneNumber) - \($0.email ?? "No email")") }
print("\nSearch result for name \"EG\":")
Contact.search(name: "EG", phoneDirectory: phoneDirectory).forEach { print("\($0.fullName) - \($0.phoneNumber) - \($0.email ?? "No email")") }
