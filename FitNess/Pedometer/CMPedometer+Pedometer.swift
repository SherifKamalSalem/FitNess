//
//  CMPedometer+Pedometer.swift
//  FitNess
//
//  Created by Sherif Kamal on 2/15/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import CoreMotion

extension CMPedometer: Pedometer {
  func start() {
    startEventUpdates { (event, error) in
      
    }
  }
}
