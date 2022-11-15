import Foundation
import Runtime

/**
 Mockingjay simplifies the generation of mock objects
 - Author: [Umut Onat Artuvan](https://github.com/umutonat)
 - Version: 1.0.0
 */
public struct Mockingjay {
    /**
     Creates a mock object
     - returns: Provided type `T`
     Example
     ```
     let users: Users? = try Mockingjay.mock()
     ```
     - Author:  [Umut Onat Artuvan](https://github.com/umutonat)
     - Version: 1.0.0
     */
    public static func mock<T>() throws -> T? {
        let info = try typeInfo(of: T.self)
        var instance = try createInstance(of: T.self) as! T

        for property in info.properties {
            if let value = try mockValue(value: property.type) {
                try property.set(value: value, on: &instance)
            }
        }
        return instance
    }

    private static func mockValue(value: Any.Type) throws -> Any? {
        switch value.self {
        case is Int.Type:
            return Int.random(in: Int.min ... Int.max)

        case is Int8.Type:
            return Int8.random(in: Int8.min ... Int8.max)

        case is Int16.Type:
            return Int16.random(in: Int16.min ... Int16.max)

        case is Int32.Type:
            return Int32.random(in: Int32.min ... Int32.max)

        case is Int64.Type:
            return Int64.random(in: Int64.min ... Int64.max)

        case is UInt.Type:
            return UInt.random(in: UInt.min ... UInt.max)

        case is UInt8.Type:
            return UInt8.random(in: UInt8.min ... UInt8.max)

        case is UInt16.Type:
            return UInt16.random(in: UInt16.min ... UInt16.max)

        case is UInt32.Type:
            return UInt32.random(in: UInt32.min ... UInt32.max)

        case is UInt64.Type:
            return UInt64.random(in: UInt64.min ... UInt64.max)

        case is String.Type:
            return UUID().uuidString

        case is Bool.Type:
            return Bool.random()

        case is Double.Type:
            return Double.random(in:  Double.leastNormalMagnitude ... Double.greatestFiniteMagnitude)

        case is Float.Type:
            return Float.random(in: Float.leastNormalMagnitude ... Float.greatestFiniteMagnitude)

        case is Decimal.Type:
            return Decimal(Double.random(in:  Double.leastNormalMagnitude ... Double.greatestFiniteMagnitude))

        case is Date.Type:
            return Date()

        case is UUID.Type:
            return UUID()

        case is Data.Type:
            return try JSONEncoder().encode(UUID().uuidString)

        case is Character.Type:
            return UUID().uuidString.first

        default:
            return nil
        }
    }
}
