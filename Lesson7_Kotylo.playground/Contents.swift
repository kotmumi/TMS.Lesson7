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
        print("\(nameShape): area = \(String(format: "%.2f", calculateArea())) мм2")
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

func randomData () -> Double { Double.random(in: 0...10) }

var shapes: [Shape] = []

shapes.append(Circle(radius: randomData(), color: "blue"))
shapes.append(Square(side: randomData(), color: "yellow"))
shapes.append(Rectangle(height: randomData(), side: randomData(), color: "green"))
shapes.append(Triangle(base: randomData(), height: randomData(), color: "red"))

shapes.forEach { $0.printArea() }
