import UIKit

var greeting = "Hello, playground"

let numbers = [1, 2, 3, 4, 5]
let doubled = numbers.map({ $0 * 2 })

doubled

let name = "John"
print("Hello, \(name)") // This will print: Hello, John

print(numbers)

let fold55 = numbers.map({
    (number: Int) -> Int in
    return number * 5
})
