//
//  MockPedometer.swift
//  FitNessTests
//
//  Created by Sherif Kamal on 2/15/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import XCTest
@testable import FitNess
import CoreMotion


class MockPedometer: Pedometer {
  private(set) var started: Bool = false
  
  func start() {
    started = true
  }
}
