<h1>Swift Algorithm and Data Structure Performance Suite</h1>

<h3>General Performance Considerations:</h3>

1. Number of Comparisons

What is the `Equatable` operation being performed? Is it expensive?

- Least expensive is comparing primitives. Lexicographic equality checking of `String` can get expensive depending on the length of the string
- Comparing reference types depends on

2. Is the search or sort area halved each time?
