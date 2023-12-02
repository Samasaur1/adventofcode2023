import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day01Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
    2shdjghdjfwhfksfkjsdeight
    ewdjfhwjkfdhwfkwjdf5wjdkflwkfljwlfjonedkljfkwlfjwklj
    """

  func testPart1() throws {
    let challenge = Day01(data: testData)
    XCTAssertEqual(String(describing: challenge.part1()), "77")
  }

  func testPart2() throws {
    let challenge = Day01(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "79")
  }

  func testHead2() throws {
    let challenge = Day01(data: """
2qlljdqcbeight
eight47srvbfive
slconeightfoureight557m38
xvqeightwosixnine61eightsn2tdczfhx
msixonexch1twokjbdlhchqk1
112ninejlhhjmjzkzgdsix
6six7jr
878eightgvsqvzfthree
2jxzhlkhdktxfjjleightdfpgfxjv
mxbzgzg5three
""")
    XCTAssertEqual(String(describing: challenge.part2()), "521")
  }

  func provided2() throws {
    let challenge = Day01(data: """
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
""")
    XCTAssertEqual(String(describing: challenge.part2()), "281")
  }

  func testOverlapping() throws {
    let challenge = Day01(data: "twone")
    XCTAssertEqual(String(describing: challenge.part2()), "21")
  }
}
