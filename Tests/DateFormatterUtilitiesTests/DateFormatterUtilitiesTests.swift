import XCTest
@testable import DateFormatterUtilities

final class DateFormatterUtilitiesTests: XCTestCase {

    func testShortDateString() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        let date = Date(timeIntervalSince1970: 0)  // 1 Jan 1970
        XCTAssertEqual(date.shortDateString, formatter.string(from: date))
    }

    func testISO8601String() {
        let date = Date(timeIntervalSince1970: 0)
        let isoString = date.iso8601String
        XCTAssertTrue(isoString.contains("1970"))
    }
    
    func testDaysBetween() {
        let calendar = Calendar.current
        let date1 = Date()
        let date2 = calendar.date(byAdding: .day, value: -5, to: date1)!
        XCTAssertEqual(date1.daysBetween(date2), 5)
    }
    
    func testInitFromShortDateString() {
        let dateString = "23/06/2025"
        let date = Date(fromShortDateString: dateString)
        
        XCTAssertNotNil(date)
        XCTAssertEqual(date?.shortDateString, dateString)
    }
}
