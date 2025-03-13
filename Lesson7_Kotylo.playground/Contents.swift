import UIKit

// MARK: -1. Разработка иерархии классов для геометрических фигур:

//•  Создайте базовый класс Shape с общими свойствами (например, цвет) и методом calculateArea().
//•  Создайте подклассы Circle, Rectangle, Triangle, наследующиеся от Shape.
//•  Переопределите метод calculateArea() в каждом подклассе для вычисления площади соответствующей фигуры.
//•  Добавьте свойства, специфичные для каждой фигуры (например, радиус для круга, длина и ширина для прямоугольника).
//•  Создайте массив объектов типа Shape и выведите площадь каждой фигуры.
class Shape {
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func calculateArea() -> Double {
       fatalError("Subclasses must implement calculateArea()")
    }
}

