//
//  IDValue.swift
//  Ents
//
//  Created by Georges Boumis on 03/04/2017.
//  Copyright © 2016-2017 Georges Boumis.
//  Licensed under MIT (https://github.com/averello/Ents/blob/master/LICENSE)
//

import Foundation

public protocol IDValue: Equatable, CustomStringConvertible {
    
    associatedtype ID: Equatable
    var rawValue: ID { get }
    init(_ rawValue: ID)
}

public extension IDValue {
    
    var description: String {
        return "\(self.rawValue)"
    }
}


public extension IDValue {
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return (lhs.rawValue == rhs.rawValue)
    }
}

public extension IDValue where ID: Comparable {

    static func <(lhs: Self, rhs: Self) -> Bool {
        return (lhs.rawValue < rhs.rawValue)
    }
}

public extension IDValue where ID: Hashable {
    
    var hashValue: Int {
        return self.rawValue.hashValue
    }
}

public extension IDValue where ID: ExpressibleByStringLiteral {
    
    typealias StringLiteralType = ID.StringLiteralType
    typealias ExtendedGraphemeClusterLiteralType = ID.ExtendedGraphemeClusterLiteralType
    typealias UnicodeScalarLiteralType = ID.UnicodeScalarLiteralType
    
    init(stringLiteral value: StringLiteralType) {
        self.init(ID(stringLiteral: value))
    }
    
    init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(ID(extendedGraphemeClusterLiteral: value))
    }

    init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(ID(unicodeScalarLiteral: value))
    }
}

public extension IDValue where ID: ExpressibleByIntegerLiteral {
    
    typealias IntegerLiteralType = ID.IntegerLiteralType
    
    init(integerLiteral value: IntegerLiteralType) {
        self.init(ID(integerLiteral: value))
    }
}
