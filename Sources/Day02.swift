import Algorithms

struct Day02: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  typealias Draw = (red: Int, green: Int, blue: Int)

  var draws: [[Draw]] {
    data.split(separator: "\n").compactMap {
      let ds = $0.split(separator: ":")[1].split(separator: ";")
      return ds.map { dr in
        let colors = dr.split(separator: ",")
        let r = #/(?<number>\d+) (?<color>[a-z]+)/#
        var d = Draw(0,0,0)
        for frag in colors {
          let m = String(frag).matches(of: r)[0]
          switch m.color {
            case "red": d.red = Int(m.number) ?? d.red
            case "green": d.green = Int(m.number) ?? d.green
            case "blue": d.blue = Int(m.number) ?? d.blue
            default: fatalError()
          }
        }
        return d
      }
    }
  }

  var mins: [Draw] {
    draws.map {
      $0.reduce(Draw(0,0,0), { l, r in Draw(max(l.red, r.red), max(l.green, r.green), max(l.blue, r.blue)) })
    }
  }

  var legalGames: [Int] {
    mins.enumerated().filter { (idx, el) in
      el.red <= 12 && el.green <= 13 && el.blue <= 14
    }.map { $0.offset + 1 }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    // calibrationValues
    legalGames.reduce(0, +)
  }
}
