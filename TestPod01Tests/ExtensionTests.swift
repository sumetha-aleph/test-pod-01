//
//  ExtensionTests.swift
//  TestPod01Tests
//
//  Created by Sumetha on 5/7/22.
//

import XCTest
import UIKit
@testable import TestPod01

class ExtensionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_uiview_identifier() throws {
        XCTAssertEqual(UIView.identifier, "UIView")
        XCTAssertEqual(UILabel.identifier, "UILabel")
        XCTAssertEqual(UITableView.identifier, "UITableView")
        XCTAssertEqual(UIScrollView.identifier, "UIScrollView")
        XCTAssertEqual(UICollectionViewCell.identifier, "UICollectionViewCell")
    }

}
