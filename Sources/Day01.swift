import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  var calibrationValues: [Int] {
    data.split(separator: "\n").compactMap {
      let digit = #/[0-9]/#
      let matches = $0.matches(of: digit)
      return Int(matches.first!.output + matches.last!.output)
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    // calibrationValues
    calibrationValues.reduce(0, +)
  }

  func parse(s: String) -> Int {
    switch s {
      case "one": 1
      case "two": 2
      case "three": 3
      case "four": 4
      case "five": 5
      case "six": 6
      case "seven": 7
      case "eight": 8
      case "nine": 9
      case "0": 0
      case "1": 1
      case "2": 2
      case "3": 3
      case "4": 4
      case "5": 5
      case "6": 6
      case "7": 7
      case "8": 8
      case "9": 9
      default: fatalError()
    }
  }

  var cv2: [Int] {
    data.split(separator: "\n").map {
      let match = #/[0-9]|one|two|three|four|five|six|seven|eight|nine/#
      let matches = $0.matches(of: match).map(\.output).map(String.init).map(parse)
      return matches.first! * 10 + matches.last!
    }
  }
  var cv2Reversed: [Int] {
    // data.split(separator: "\n").map(String.reversed).map {
    //   let match = #/enin|thgie|neves|xis|evif|ruof|eerht|owt|eno|[0-9]/#
    //   let matches = $0.matches(of: match).map(\.output).map(String.init).map(String.reversed).map(String.init).map(parse).reversed()
    //   return matches.first! * 10 + matches.last!
    // }
    data.split(separator: "\n").map {
      let forward = #/[0-9]|one|two|three|four|five|six|seven|eight|nine/#
      let backward = #/enin|thgie|neves|xis|evif|ruof|eerht|owt|eno|[0-9]/#
      let first = String($0.firstMatch(of: forward)!.output)
      let last = String(String(String($0.reversed()).firstMatch(of: backward)!.output).reversed())
      return parse(s: first) * 10 + parse(s: last)
    }
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // cv2.reduce(0, +)
    cv2Reversed.reduce(0, +)
  }
}
