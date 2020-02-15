 
 
 //  Created by Sherif Kamal on 1/16/20.
 //  Copyright © 2020 Sherif Kamal. All rights reserved.
 
 import CoreMotion
 
 class AppModel {
  
  static let instance = AppModel()
  
  let dataModel = DataModel()
  let pedometer: Pedometer
  private(set) var appState: AppState = .notStarted {
    didSet {
      stateChangedCallback?(self)
    }
  }
  
  var stateChangedCallback: ((AppModel) -> ())?
  
  // MARK: - App Lifecycle
  init(pedometer: Pedometer = CMPedometer()) {
    self.pedometer = pedometer
  }
  
  func start() throws {
    guard dataModel.goal != nil else {
      throw AppError.goalNotSet
    }
    appState = .inProgress
    startPedometer()
  }
  
  func pause() {
    appState = .paused
  }
  
  func restart() {
    appState = .notStarted
    dataModel.restart()
  }
  
  func setCaught() throws {
    guard dataModel.caught else {
      throw AppError.invalidState
    }
    
    appState = .caught
  }
  
  func setCompleted() throws {
    guard dataModel.goalReached else {
      throw AppError.invalidState
    }
    
    appState = .completed
  }
 }
 extension AppModel {
  func startPedometer() {
    pedometer.start()
  }
 }
 
