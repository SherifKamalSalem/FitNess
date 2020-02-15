//
//  PedometerTests.swift
//  FitNessTests
//
//  Created by Sherif Kamal on 2/14/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import XCTest
@testable import FitNess
import CoreMotion

class PedometerTests: XCTestCase {
  
  var sut: CMPedometer!
  
  override func setUp() {
    sut = CMPedometer()
  }
  
  override func tearDown() {
    sut = nil
  }
}
