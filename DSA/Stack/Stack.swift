//
//  Stack.swift
//  DSA
//
//  Created by Enigma Kod on 22/06/2023.
//

import Foundation

protocol Stack {
    associatedtype Item
    
    func append(_ item: Item) -> Void
    
    func pop() -> Item?
    
    var stackCount: Int { get }
    
    var hasItem: Bool { get }
    
    var peek: Item? { get }
}

/// I Wanted to use struc but that would require me to make some function as mutating
/// and i don't want my protocol (interface) to have that mutating keyword also, so i am
/// using `class`
///
/// My Generic `Item` must conform to `Equatable` cause i would like to perform
/// Equatable operation in my Unit Test
class InMemoryStack<Element>: Stack {
    private var storage: [Element] = []
    
    public var stackCount: Int {
        return storage.count
    }
    
    public var hasItem: Bool {
        return stackCount > 0
    }
    
    public var peek: Element? {
        return storage.last
    }
    
    public func append(_ item: Element) {
        storage.append(item)
    }
    
    @discardableResult public func pop() -> Element? {
        guard hasItem else { return nil }
        return storage.popLast()
    }
}

extension InMemoryStack: CustomStringConvertible {
    public var description: String {
        """
        ----top----
        \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
        -----------
        """
    }
}

public func example(of description: String, action: () -> Void) {
    print("---Example of \(description)---")
    action()
    print()
}
