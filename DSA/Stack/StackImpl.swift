//
//  Stack.swift
//  DSA
//
//  Created by Enigma Kod on 22/06/2023.
//

import Foundation

protocol Stack {
    associatedtype Item
    
    mutating func append(_ item: Item) -> Void
    
    mutating func pop() -> Item?
    
    var stackCount: Int { get }
    
    var hasItem: Bool { get }
    
    var peek: Item? { get }
}


// Make a the stack 

struct InMemoryStack<Element: Hashable>: Stack {
    private var storage: [Element] = []
    
//    var _currentIndex: Int?
//    var currentIndex: Int = storage.count - 1
    
    public var stackCount: Int {
        return storage.count
    }
    
    public var hasItem: Bool {
        return stackCount > 0
    }
    
    public var peek: Element? {
        return storage.last
    }
    
    public mutating func append(_ item: Element) {
        storage.append(item)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        guard hasItem else { return nil }
        return storage.popLast()
    }
    
    // MARK: - Conditonally Conform
    
    // Equatable
    static func == (lhs: InMemoryStack, rhs: InMemoryStack) -> Bool {
        return lhs.storage == rhs.storage
    }
    
    // Identifiable
    // This is wrong, know why!!
    var id: UUID { return UUID() }
    
    // Hashable
    func hash(into hasher: inout Hasher) {
        storage.forEach { hasher.combine($0) }
    }
}

extension InMemoryStack: Sequence {
    func makeIterator() -> AnyIterator<Element> {
        var currentIndex = storage.count - 1

        return AnyIterator {
            guard currentIndex >= 0 else { return nil }
            defer { currentIndex -= 1 }
            return self.storage[currentIndex]
        }
    }
    
//    func makeIterator() -> Element {
//        return StackIterator(currentIndex: storage.count - 1)
//    }
}


//extension InMemoryStack: Collection {
//
//}
 struct StackIterator: IteratorProtocol {
    var currentIndex: Int

    mutating func next() -> Int? {
        if currentIndex == 0 {
            return nil
        } else {
            defer { currentIndex -= 1 }
            return currentIndex
        }
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






// - Create Stack with custom IteratorProtocol
