<h1>Swift Algorithm and Data Structure Performance Suite</h1>

<h3>General Performance Considerations:</h3>

1. Number of Comparisons

What is the `Equatable` operation being performed? Is it expensive?

- Least expensive is comparing primitives. Lexicographic equality checking of `String` can get expensive depending on the length of the string
- Comparing reference types depends on the `Equatable` implementaiton

2. Is the search or sort area halved each time?

<h3>Taxonomy of Iteration Types</h3>

<h4>Ranges</h4>
Half-Open Range (..<)

Closed Range

<h4>Windowing</h4>
Closing Window
- Leftward
    - (1..<array.count).reversed()
- Rightward
    - (1..<array.count)

Opening Window

Sliding Window

<h4>Index Manipulation in Swift</h4>

[Range Types](https://medium.com/@lucianoalmeida1/exploring-range-types-in-swift-e0e7ab27ab79)
[CountableRange](https://swiftdoc.org/v3.0/type/countablerange/)
[BidirectionalCollection](https://developer.apple.com/documentation/swift/bidirectionalcollection)
[.reversed()](https://developer.apple.com/documentation/swift/array/1690025-reversed)
