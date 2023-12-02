import Algorithms

struct Day00: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var lines: [String] {
    data.split(separator: "\n").map { String($0) }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    lines.reduce(into: 0) { sum, line in
      var (lo, hi) = (line.startIndex, line.index(before: line.endIndex))
      var firstDigit: Int? = nil
      var lastDigit: Int? = nil
  
      while lo <= hi, firstDigit == nil || lastDigit == nil {
        if firstDigit == nil {
          if let d = line[lo].wholeNumberValue {
            firstDigit = d
          } else {
            lo = line.index(after: lo)
          }
        }
        if lastDigit == nil {
          if let d = line[hi].wholeNumberValue {
            lastDigit = d
          } else {
            hi = line.index(before: hi)
          }
        }
      }
      let calibrationValue = firstDigit! * 10 + lastDigit!
      sum += calibrationValue
    }
  }

  func part2() -> Any {
    lines.reduce(into: 0) { sum, line in
      var (lo, hi) = (line.startIndex, line.index(before: line.endIndex))
      var firstDigit: Int? = nil
      var lastDigit: Int? = nil
      let spellings: [Int: String] = [
        1: "one", 2: "two", 3: "three", 
        4: "four", 5: "five", 6: "six", 
        7: "seven", 8: "eight", 9: "nine"
      ]
      var lstring = ""
      var rstring = ""
      while lo <= hi, firstDigit == nil || lastDigit == nil {
        for (d, spelling) in spellings {
          if lstring.hasSuffix(spelling) {
            firstDigit = d
          }
          if rstring.hasPrefix(spelling) {
            lastDigit = d
          }
        }
        if firstDigit == nil {
          if let d = line[lo].wholeNumberValue {
            firstDigit = d
          } else {
            lstring = "\(lstring)\(line[lo])"
            lo = line.index(after: lo)
          }
        }
        if lastDigit == nil {
          if let d = line[hi].wholeNumberValue {
            lastDigit = d
          } else {
            rstring = "\(line[hi])\(rstring)"
            hi = line.index(before: hi)
          }
        }
      }
      let calibrationValue = firstDigit! * 10 + lastDigit!
      sum += calibrationValue
    }
  }
}
