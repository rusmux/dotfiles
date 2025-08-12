import AppKit
import ArgumentParser

@main
struct spelling: ParsableCommand {
    @Argument()
    var dictPath: String

    func run() throws {
        let words = try String(contentsOf: URL(filePath: dictPath)).split(
            whereSeparator: \.isNewline
        ).map { String($0) }

        let checker = NSSpellChecker.shared
        let tag = NSSpellChecker.uniqueSpellDocumentTag()

        for word in words {
            let range = checker.checkSpelling(
                of: word, startingAt: 0, language: getLang(word), wrap: false,
                inSpellDocumentWithTag: tag, wordCount: nil)

            if range.location == NSNotFound {
                print(word)
            }
        }
    }
}

func getLang(_ word: String) -> String {
    guard let first = word.first else { return "en" }
    if first.unicodeScalars.allSatisfy({ scalar in (0x0400...0x04FF).contains(scalar.value) }) {
        return "ru"
    } else {
        return "en"
    }
}
