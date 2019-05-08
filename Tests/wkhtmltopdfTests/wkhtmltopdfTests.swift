import XCTest
@testable import wkhtmltopdf

class wkhtmltopdfTests: XCTestCase {
  static var allTests = [
    ("testStringPDF", testStringPDF),
  ]

  func testStringPDF() throws {
    let document = Document(margins: 15)
    let page1 = Page("<p>Page from direct HTML</p>")
    document.pages = [page1]
    let data = try document.generatePDF()
    // Cop-out test, just ensuring that the returned data is something
    XCTAssert(data.count > 50)
    // Visual test

    FileManager.default.createFile(atPath: "/tmp/vapor-wkhtmltopdf/testOutput.pdf", contents: data, attributes: nil)

    print("Test output PDF can be viewed at /tmp/vapor-wkhtmltopdf/testOutput.pdf")
  }
}
