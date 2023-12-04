import Algorithms
import BigInt

struct Day04: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  struct Card {
    let winningNumbers: [Int]
    let numbers: [Int]
  }

  var cards: [Card] {
    data.split(separator: "\n").map { line in
      let sections = line.split(separator: ":")[1].split(separator: "|")
      let int_sections = sections.map { s in
        s.split(separator: " ").map(String.init).compactMap(Int.init)
      }
      return Card(winningNumbers: int_sections[0], numbers: int_sections[1])
    }
  }

  func points(_ c: Card) -> Int {
    let count = c.numbers.filter { c.winningNumbers.contains($0) }.count
    return 1 << (count - 1)
  }

  func part1() async throws -> Any {
    cards.map(points(_:)).reduce(0, +)
  }
}
