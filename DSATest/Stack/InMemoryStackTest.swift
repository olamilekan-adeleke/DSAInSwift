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
        var stack = InMemoryStack<Int>()
        XCTAssertEqual(stack.stackCount, 0)
        stack.append(0)
        XCTAssertEqual(stack.stackCount, 1)
    }

    func testHasItem() throws {
        var stack = InMemoryStack<Int>()
        XCTAssertEqual(stack.hasItem, false)
        stack.append(0)
        stack.append(1)
        XCTAssertEqual(stack.hasItem, true)
    }

    func testPeek() throws {
        var stack = InMemoryStack<Int>()
        XCTAssertNil(stack.peek)
        stack.append(0)
        stack.append(1)
        stack.append(2)
        XCTAssertEqual(stack.peek, 2)
        stack.pop()
        XCTAssertEqual(stack.peek, 1)
    }

    func testAppendItemToStack() throws {
        var stack = InMemoryStack<String>()
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
        var stack = InMemoryStack<String>()
        XCTAssertNil(stack.pop())
        stack.append("A")
        XCTAssertEqual(stack.pop(), "A")
        XCTAssertFalse(stack.hasItem)
    }

    func testDescription() throws {
        var stack = InMemoryStack<Int>()
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

    // ----
    func testSequence() throws {
        var stack = InMemoryStack<Int>()
//        stack.append(1)
//        stack.append(2)
//        stack.append(3)
//        stack.append(4)
//        stack.append(5)
//        stack.append(6)
//
//        for ele in stack {
//            XCTAssertEqual(ele, 6)
//        }
    }
    
    func test_custom_type_which_only_confrom_to_equatable_should_be_use_by_the_stack()  {
        
    }
    
    func test_custom_type_which_only_confrom_to_hashable_should_be_use_by_the_stack()   {
        
    }
}
