//
//  StackTest.swift
//  DSATest
//
//  Created by Enigma Kod on 22/06/2023.
//
@testable import DSA

import XCTest

final class StackTest: XCTestCase {
    func testStackCount() throws {
        let stack = InMemoryStack<Int>()
        XCTAssertEqual(stack.stackCount, 0)
        stack.append(0)
        XCTAssertEqual(stack.stackCount, 1)
    }

    func testHasItem() throws {
        let stack = InMemoryStack<Int>()
        XCTAssertEqual(stack.hasItem, false)
        stack.append(0)
        stack.append(1)
        XCTAssertEqual(stack.hasItem, true)
    }

    func testPeek() throws {
        let stack = InMemoryStack<Int>()
        XCTAssertNil(stack.peek)
        stack.append(0)
        stack.append(1)
        stack.append(2)
        XCTAssertEqual(stack.peek, 2)
        stack.pop()
        XCTAssertEqual(stack.peek, 1)
    }

    func testAppendItemToStack() throws {
        let stack = InMemoryStack<String>()
        XCTAssertFalse(stack.hasItem)
        stack.append("A")
        stack.append("B")
        XCTAssertEqual(stack.peek, "B")
        XCTAssertEqual(stack.stackCount, 2)
        stack.append("C")
        XCTAssertEqual(stack.stackCount, 3)
        let item = stack.pop()
        XCTAssertEqual(item, "C")
        XCTAssertEqual(stack.peek, "B")
    }

    func testPopStack() throws {
        let stack = InMemoryStack<String>()
        XCTAssertNil(stack.pop())
        stack.append("A")
        XCTAssertEqual(stack.pop(), "A")
        XCTAssertFalse(stack.hasItem)
    }

    func testDescription() throws {
        let stack = InMemoryStack<Int>()
        stack.append(0)
        stack.append(1)
        stack.append(2)

        let string = """
        ----top----
        2
        1
        0
        -----------
        """

        XCTAssertEqual(stack.description, string)
    }
}
