//: Playground - noun: a place where people can play

import UIKit

//
// MARK: - 基础语法
//

// MARK: - 普通标记
// TODO: TODO 待实现标记
// FIXME: FIXME 待修复标记

/*
 这里是多行注释
 /*
 Swift的多行注释不同于其它语言，Swift支持嵌套注释
 */
 */

// Swift 2.0 开始 println() 和 print() 已经整合成print().
print("Hello, Swift") // 会自动换行
print("Hello, Swift", terminator: "") // 设定结束符为空字符串，不进入下一行

// Swift 中不论定义那种类型的常量或者变量都用 let 或者 var
var myVariable = 18

let 🏷 = "value" // 可以支持unicode变量名
let π = 3.1415926
let myConstant = 3.1415926
// Swift 具有推断变量类型能力，如果没有明确变量类型，会根据第一次赋值推断变量类型
let explicitDouble: Double = 12 // 明确指定变量类型为Double

let weak = "keyword"; let override = "another keyword" // 语句之间可以用分号隔开，语句末尾不需要分号
let intValue = 007 // 7
let largeIntValue = 99_000 // 99000
let label = "Some Text" + String(myConstant) // 类型转换
let piText = "Pi = \(π), Pi 2 = \(π * 2)" // 格式化字符串

// 条件编译
// 使用 -D 定义编译开关
#if false
print("Not printed")
let buildValue = 3
#else
let buildValue = 7
#endif

print("Build value: \(buildValue)")

/*
 可选型 Optionals 是Swift的新特性，它允许你存储两种状态的值给Optional 变量：有效值或者Nil
 可在值名称后加个问号（？）来表示这个值是Optional.
 Swift 要求所有的Otional属性都必须有明确的值，如果为空，则必须明确设定为nil
 Optional<T> 是一个枚举类型
 */

var someOptionalString: Optional<String> = "Optional"
// 下面的语句和上面完全等价, 上面是推荐写法，因为它更简洁，问号（?）是Swift 提供的语法糖
var someOptionalString2: String? = "Optional" // 可以为nil

// 可选型不能直接使用，使用需要解包
if someOptionalString != nil {
    // 变量不为空
    if someOptionalString!.hasPrefix("Opt") {
        print("has the perfix")
    }
    let empty = someOptionalString?.isEmpty
}
someOptionalString = nil

/*
 使用（!）可以解决无法访问Optional值得运行错误。若要使用（!）强制解析，一定要确保Optional里不是nil参数
 */

// 显示解包Optional 变量
var unwrappedString: String! = "Value is expected."
var unwrappedString2: Optional<String> = "Value is expected." // 和上面完全等价，（!）也是语法糖，推荐写法
if let someOptionalStringConstant = someOptionalString {
    // 由于变量someOptionalString 有值，不为空，所以 if 条件为真
    if !someOptionalStringConstant.hasSuffix("ok") {
        // does not have the prefix
    }
}

someOptionalString2 = nil
func fooGuard() {
    // 还有一种是先处理为空的
    guard someOptionalString2 != nil else {
        print("value is nil")
        return
    }
}

// Swift 支持保存任何数据类型的变量
// AnyObject == id
// 和Obective-C 的 'id' 不一样，AnyObject 可以保存任何类型的值（Class, Int, struct等）Swift3.0开始需要使用 as
var anyObjectVar: AnyObject = 7 as AnyObject
anyObjectVar = "Changed value to a string, not good practice, but possible." as AnyObject


//
// MARK: - 数组与字典（关联数组）
//

/*
 Array 和 Dectionary 是结构体，不是类，它们作为函数参数时，是用值传递而不是指针传递
 可以用 ‘var’ 和 ‘let’ 来定义变量和常量
 */

// Array
var shoppingList = ["catfish", "water", "lemons"]
shoppingList[1] = "bottle of water"
let emptyArray = [String]() // 使用 let 定义常量时，emptyArray 是不可变的，不能进行添加和删除
let emptyArray2 = Array<String>() // 与上一句等价，上一句比较常用
var emptyMutableArray = [String]() // 使用 var 定义变量，此时emptyMutableArray 是可变的，可以进行添加和删除数组元素
var explicitEmptyMutableStringArray: [String] = [] // 与上一句等价

// Dectionary
var occupations = ["Malcolm" : "Captain", "Kaylee" : "Mechanic"]
occupations["jayne"] = "Public Relations" // 修改字典，如果key不存在， 自动添加一个字典元素

let emptyDictionary = [String: Float]() // 使用 let 定义字典常量，字典是一个不可变得，不允许修改里面的值
let emptyDictionary2 = Dictionary<String, Float>() // 与上一句等价，上一句更常用

var emptyMutableDictionary = [String : Float]() // 使用 var 定义字典常量，字典是一个可变字典
var explicityEmptyMutableDictionary: [String: Float] = [:] // 与上一句等价


// 用数组实现栈
class Stack {
    var stack: [AnyObject]
    var isEmpty: Bool { return stack.isEmpty }
    var peek: AnyObject? { return stack.last }
    
    init() {
        stack = [AnyObject]()
    }
    
    func push(object: AnyObject) {
        stack.append(object)
    }
    
    func pop() -> AnyObject? {
        if (!isEmpty) {
            return stack.removeLast()
        } else {
            return nil
        }
    }
}

//
// MARK: - 控制流
//

// 数组的 for 循环
let myArray = [1, 3, 3, 5, 6]
for value in myArray {
    if value == 3 {
        print("Three!")
    } else {
        print("Not Three!")
    }
}

// 字典的 for 循环
var dict = ["one" : 1, "two": 2]
for (key, value) in dict {
    print("\(key) : \(value)")
}

// 区间的 loop 循环：其中 ‘...’ 表示闭环期间，即[2, 6]; '..<' 表示半开闭区间，即[2, 6)
for i in -1...shoppingList.count {
    print(i)
}

shoppingList[1...2] = ["steak", "peacons"]
// 可以使用 ‘..<’ 来去掉最后一个元素

// while 循环
var i = 1
while i < 1000 {
    i *= 2
}

// repeat-while 循环 相当于do-while
repeat {
    print("Swift")
} while 1 == 2

// Switch 语句
// Swift 里的 Switch 语句功能异常强大，结合枚举类型，可以实现非常简洁的代码，可以把switch 语句想象成 ‘if’ 的语法糖
// Swift 里的 Switch 支持字符串，类实例或者原生数据类型（Int, Double, etc）
let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let localScopeValue where localScopeValue.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(localScopeValue) ?"
default: // 在 Swift 里，switch 语句的 case 必须处理所有可能的情况，如果 case 无法全部处理，则必须包含 default语句
    let vegetableComment = "Everything tastes good in soup."
}

//
// MARK: - 函数
//

// 函数是一个first-class，它们可以嵌套，可以作为函数参数传递

// 函数文档注释可以使用 reStructedText 格式直接写在函数的头部

/**
 A greet operation
 
 - parameter name: name
 - parameter day:  day
 
 - returns: A string containing the name and day value.
 */
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}

// 执行函数 swift3.0 第一个参数名也要写上
greet(name: "Jack", day: "Tuesday")

/**
 A greet operation
 
 - parameter requiredName:   外部参数名和内部参数名称使用同一个名称，swift3.0开始如果外部和内部参数名称一样，可以只写一个
 - parameter localParamName: 外部参数名使用“externalParamName”,内部参数名使用"localParamName"
 
 - returns: A string containing the name and day value.
 */
func greet2(requiredName:String, externalParamName localParamName: String) -> String {
    return "Hello \(requiredName), the day is \(localParamName)"
}

// 调用时，使用命名参数来指定参数的值
greet2(requiredName: "DeveloperLY", externalParamName: "Sunday")

// 函数可以通过元组（tuple）返回多个值
func getGasPrices() -> (Double, Double, Double) {
    return (3.13, 32.434, 43.23);
}

let pricesTuple = getGasPrices()
let price = pricesTuple.1

// 可以通过下划线（_）来忽略不关心的值
let (_, price1, _) = pricesTuple // price1 == 32.434
print(price1 == pricesTuple.1) // true
print("Gas price: \(price)")


// 可变参数
func setUp(numbers: Int...) {
    // 可变参数是一个数组
    let _ = numbers[0]
    let _ = numbers.count
}

// 函数变量以及函数作为返回值返回 swift 3.0 后，参数类型必须用小括号括起来
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()
increment(8)

// 强行进行指针传递（引用传递），使用 ‘inout’ 关键字修饰函数参数 Swift 3.0 后，inout 关键字变为参数类型的修饰符
func swapTwoInts( a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var someIntA = 7
var someIntB = 3
swapTwoInts(a: &someIntA, b: &someIntB)
print(someIntA) // 3

//
// MARK: - 闭包（Block）
//
var numbers = [2, 3, 4, 5, 6]

/**
 函数是闭包的一个特例（{}）
 闭包实例
 ‘->’ 分割了闭包的参数和返回值
 ‘in’ 分割了闭包头（包括参数及返回值）和闭包体
 */
// 下面例子中，‘map’的参数是一个函数类型，它的功能是把数组里的元素作为参数，逐个调用‘map’参数传递进来的函数
numbers.map { (number: Int) -> Int in
    let result = 3 * number
    return result
}

// 当闭包的参数类型和返回值都已知的情况下，且只有一个语句作为其返回值时，可以简化闭包的写法
numbers = numbers.map({ number in 3 * number})
// 也可以使用$0, $1 来指代第一个，第二个参数，上面的语句最终可以简写为如下形式
numbers = numbers.map({$0 * 3})

print(numbers)

// 简洁的闭包 Swift 3.0 后 sort -> sorted
numbers = numbers.sorted {$0 > $1}

print(numbers)


//
// MARK: - 结构体
//

// 结构体和类非常类似，可以有属性和方法
struct NamesTable {
    let names: [String]
    
    // 自定义下标运算符
    subscript(index: Int) -> String {
        return names[index]
    }
}

// 结构体有一个自动生成的隐含的命名构造函数
let namesTable = NamesTable(names: ["Me", "Them", "Jackly"])
let name = namesTable[2]
print("Name is \(name)")


//
// MARK: - 类
//

/**
 类和结构体的有三个访问控制级别，分别是 internal (默认), public, private
 internal: 模块内部可以访问
 public: 其它模块可以访问
 private: 只有定义这个类或者结构体的源文件才能访问
 */

public class Shape {
    public func getArea() -> Int {
        return 0
    }
}

// 类的所有方法和属性都是 public 的
// 如果只需要把数据保存在一个结构化的实例里面，应该用结构体

internal class Rect: Shape {
    // 值属性 （Stored properties）
    var sideLength: Int = 1
    
    // 计算属性 （Computed properties）
    private var perimeter: Int {
        get {
            return 3 * sideLength
        }
        set {
            // 'newValue' 是一个隐含的变量，它表示将要设置进来的新值
            sideLength = newValue / 3
        }
    }
    
    // 命名构造函数（designated inits）,它必须初始化所有的成员变量，然后调用父类的命名构造函数继续初始化父类的所有变量。
    init(sideLength: Int) {
        self.sideLength = sideLength;
        // 必须显式地在构造函数中最后调用父类的构造函数 super.init()
        super.init()
    }
    
    
    // 延时加载(懒加载)的属性，只有这个属性第一次被引用才进行初始化，而不是定义时就初始化
    // subShape 值为 nil ,直到subShape 第一次被引用时才初始化为一个 Rect 实例
    lazy var subShape = Rect(sideLength: 3)
    
    // 监控属性值的变化
    // 当需要在属性值改变的时候做一些事情，可以使用 ‘willSet’ 和 ‘didSet’ 来设置监控函数
    // ‘willSet’: 值改变之前被调用
    // ‘didSet’: 值改变之后被调用
    var identifier: String = "defaultID" {
        // `willSet` 的参数是即将设置的新值，参数名可以指定，如果没有指定，就是 `newValue`
        willSet(someIdentifier) {
            print(someIdentifier)
        }
        
        // `didSet` 的参数是已经被覆盖掉的旧的值，参数名也可以指定，如果没有指定，就是 `oldValue`
        didSet {
            print(oldValue)
        }
    }
    
    func shrink() {
        if sideLength > 0 {
            sideLength -= 1
        }
    }
    
    // 函数重载使用 override 关键字
    override func getArea() -> Int {
        return sideLength * sideLength
    }
    
}

// 类 ‘Square’ 从 ‘Rect’ 继承
class Square: Rect {
    // 便捷构造函数（convenience inits）是调用自己的命名构造函数（designated inits）的构造函数
    // Square 自动继承了父类的命名构造函数
    convenience init() {
        self.init(sideLength: 6)
    }
    /**
     关于构造函数的继承，有以下的几个规则：
     1. 如果你没有实现任何命名构造函数，那么你就继承了父类的所有命名构造函数
     2. 如果你重载了父类的所有命名构造函数，那么你就自动继承了所有的父类快捷构造函数
     3. 如果你没有实现任何构造函数，那么你继承了父类的所有构造函数，包括命名构造函数和便捷构造函数
     */
}

var mySquare = Square()
print(mySquare.getArea()) // 36
mySquare.shrink()
print(mySquare.sideLength) // 5
mySquare.identifier = "someID"

// 类型转换
let aShape = mySquare as Shape

// 使用三个等号来比较是不是同一个实例
if mySquare === aShape {
    print("Yep, it's mySquare")
}


class Circle: Shape {
    var radius: Int
    override func getArea() -> Int {
        return 3 * radius * radius
    }
    
    // optional 构造函数，可能会返回nil
    init?(radius: Int) {
        self.radius = radius
        super.init()
        
        if radius <= 0 {
            return nil
        }
    }
}

// 根据 Swift 类型推断，myCircle 是 Optional<Circle> 类型的变量
var myCircle = Circle(radius: 2)
// Swift 3.0 后 需要用 ?? 设置一个默认值解包
print(myCircle?.getArea() ?? 0)  // Optional(12)
print(myCircle!.getArea())  // 12

var myEmptyCircle = Circle(radius: -1)
print(myEmptyCircle?.getArea() ?? 0) // nil

if let circle = myEmptyCircle {
    print("circle is not nil") // 不会输出，myEmptyCircle 变量值为 nil
}


//
// MARK: - 枚举
//

// 枚举可以像类一样，拥有方法

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func getIcon() -> String {
        switch self {
        case .Spades: return "♤"
        case .Hearts: return "♡"
        case .Diamonds: return "♢"
        case .Clubs: return "♧"
        }
    }
}

// 当变量类型明确指定为某个枚举类型时，赋值时可以省略枚举类型
var suitValue: Suit = .Hearts

// 非整型的枚举类型需要在定义时赋值
enum BookName: String {
    case John = "John"
    case Luke = "Luke"
}
print("Name:  \(BookName.John.rawValue)")

// 与特定数据类型关联的枚举
enum Furniture {
    // 与 Int 型数据关联的枚举
    case Desk(Height: Int)
    // 与 String, Int 关联的枚举记录
    case Chair(brand: String, height: Int)
    
    func description() -> String {
        switch self {
        case .Desk(let height):
            return "Desk with \(height) cm"
        case .Chair(let brand, let height):
            return "Chair of \(brand) with \(height) cm"
        }
    }
}

var desk: Furniture = .Desk(Height: 180)
print(desk.description())
var chair = Furniture.Chair(brand: "Foo", height: 40)
print(chair.description())


//
// MARK: - 协议
//

// 协议可以让遵循同一协议的类型实例拥有相同的属性，方法，类方法，操作符或下标运算符等
// 下面代码定义一个协议，这个协议包含一个名为 enabled 的计算属性且包含 buildShape 方法
protocol ShapeGenerator {
    var enabled: Bool { get set }
    func buildShape() -> Shape
}

/*
 协议声明时可以添加 @objc，添加 @objc 前缀后，
 可以使用 is, as, as? 等来检查协议兼容性
 需要注意，添加 @objc 前缀后，协议就只能被类来实现，
 结构体和枚举就不能实现加了 @objc 前缀的协议
 只有添加了 @objc 前缀的协议才能声明 optional 方法
 一个类实现一个带 optional 方法的协议时，可以实现或不实现这个方法
 optional 方法可以使用 optional 规则来调用
 */

@objc protocol TransformShape {
    // Swift 3.0 方法也要加上@objc
    @objc optional func reshape()
    @objc optional func canReshape() -> Bool
}


class MyShape: Rect {
    var delegate: TransformShape?
    
    func grow() {
        sideLength += 2
        // 在 optiaonal 属性，方法或者下标运算符后面加一个问号，可以优雅地忽略 nil 值，返回 nil
        
        // 这样就不会引起运行时错误 （runtime error）
        if let reshape = self.delegate?.canReshape?(), reshape {
            // 注意语句中的问号
            self.delegate?.reshape?()
        }
    }
}

//
// MARK: - 其它
//

// 扩展： 给一个已经存在的数据类型添加功能

// 给 Square 类添加 `CustomStringConvertible` 协议的实现，现在其支持 `CustomStringConvertible` 协议
extension Square: CustomStringConvertible {
    var description: String {
        return "Area: \(self.getArea()) - ID: \(self.identifier)"
    }
}

print("Square: \(mySquare)")

// 也可以给系统内置类型添加功能支持
extension Int {
    var customProperty: String {
        return "This is \(self)"
    }
    
    func multiplyBy(num: Int) -> Int {
        return num * self
    }
}

print(7.customProperty)
print(3.multiplyBy(num: 4))

// 泛型： 和Java 及 C# 的泛型类似，使用 ‘where’ 关键字来限制类型。
// 如果只有一个类型限制，可以省略 'where' 关键字
func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let foundAtIndex = findIndex(array: [1, 3, 4, 5], 4)
print(foundAtIndex == 2)

// 自定义运算符：
// 自定义运算符可以以下面的字符开头：
// / = - = * % < > ! & | ^ . ~
// 甚至是 Unicode 的数学运算符等
prefix operator !!!

// 定义一个前缀运算符，使矩形的边长放大三倍
prefix func !!! ( shape: inout Square) -> Square {
    shape.sideLength *= 3
    return shape
}

// 当前值
print(mySquare.sideLength) // 5

// 使用自定义的 !!! 运算符来把矩形边长放大三倍
!!!mySquare
print(mySquare.sideLength)

// 运算符也可以是泛型
infix operator <->
func <-><T: Equatable>( a: inout T, b: inout T) {
    let c = a
    a = b
    b = c
}


var foo: Float = 10
var bar: Float = 20

foo <-> bar

print("foo is \(foo), bar is \(bar)")


func exampleofFunction(parameter: String) -> String {
    let result = "Helle \(parameter)"
    return result
}


/// 泛型
func show<T>(para: T) {
    print("Hello \(para)")
}

show(para: 3)
show(para: "DeveloperLY")

func show<T>(para1: T, para2: T) {
    print("para1:\(para1)-----para2:\(para2)")
}

// 只能插入相同类型的值
show(para1: 11, para2: 33)

func show<T, U>(para1: T, para2: U) {
    print("para1:\(para1)-----para2:\(para2)")
}

show(para1: "DeveloperLY", para2: 18)


// 断言
func TestAssertions() -> Bool {
    return true
}

assert(TestAssertions(), "返回false")


// precondition
extension Array {
    func ifOutOfBounds(index: Int) {
        precondition((0..<endIndex).contains(index), "数组越界了")
        print("继续执行")
    }
}

[1, 3, 4].ifOutOfBounds(index: 0)
[1, 3, 4].ifOutOfBounds(index: 2)



// 同构和异构
// 数据源中的同构与异构
protocol CanFly {
    func fly()
}

struct Bird: CanFly {
    var name = ""
    func fly() {
        print("鸟类在飞翔")
    }
}

struct Airplane: CanFly {
    var company = ""
    func fly() {
        print("飞机在飞行")
    }
}

var flyArray: [CanFly] = [Bird(name: "麻雀"), Airplane(company: "中国东方航空")]

flyArray.append(Bird(name: "喜鹊"))

for f in flyArray {
    f.fly()
}

// 数组操作Demo // 根据名字拼音首字母排序
struct Person {
    var id = ""
    var name = ""
    var phone = ""
}

let personArray = [Person(id: "111", name: "张三", phone: "155*******3"), Person(id: "112", name: "李四", phone: "135*******2"), Person(id: "113", name: "王五", phone: "187*******7"), Person(id: "114", name: "赵六", phone: "151*******6")]

// 无效，因为汉子的ASKII码不是按照发音排序的
let sorteArray = personArray.sorted {
    return $0.name < $1.name
}

// 利用系统提供的API, 封装汉子转拼音的方法
func transform(chiness: String) -> String {
    let mutableStr = NSMutableString(string: chiness) as CFMutableString
    if CFStringTransform(mutableStr, nil, kCFStringTransformToLatin, false) && CFStringTransform(mutableStr, nil, kCFStringTransformStripCombiningMarks, false) {
        return mutableStr as String
    } else {
        return ""
    }
}

print(transform(chiness: "冰晨"))

// 由于中文转拼音的是比较耗时的，当联系人数很多时，程序就会产生很明显的性能问题了
// 对于同一中文字段重复调用多次transform是毫无意义的
let sortedArray = personArray.sorted {
    print("对比的对象：\($0.name), \($1.name)")
    return transform(chiness: $0.name) < transform(chiness: $1.name)
}

// 性能优化
let sortedArray1 = personArray.map {
    ($0, transform(chiness: $0.name))
    }.sorted {
        $0.1 < $1.1
    }.map {
        $0.0
}

