import Foundation

public extension Date {
    
    /// Returns a date string in "dd/MM/yyyy" format
    var shortDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: self)
    }
    
    /// Returns a date string in ISO8601 format
    var iso8601String: String {
        ISO8601DateFormatter().string(from: self)
    }
    
    /// Calculates days between self and another date
    func daysBetween(_ other: Date) -> Int {
        let calendar = Calendar.current
        let start = calendar.startOfDay(for: self)
        let end = calendar.startOfDay(for: other)
        let components = calendar.dateComponents([.day], from: start, to: end)
        return components.day ?? 0
    }
    
    /// Initializes Date from "dd/MM/yyyy" format
    init?(fromShortDateString string: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        guard let date = formatter.date(from: string) else { return nil }
        self = date
    }
}
