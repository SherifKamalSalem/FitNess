 

 //  Created by Sherif Kamal on 1/16/20.
 //  Copyright © 2020 Sherif Kamal. All rights reserved.

import XCTest
@testable import FitNess
 
class RootViewControllerTests: XCTestCase {

  var sut: RootViewController!
  
  override func setUp() {
    super.setUp()
    sut = loadRootViewController()
    sut.reset()
  }
  
  override func tearDown() {
    sut = nil
    AlertCenter.instance.clearAlerts()
    super.tearDown()
  }
  
  // MARK: - Alert Container
  func testWhenLoaded_noAlertsAreShown() {
    XCTAssertEqual(AlertCenter.instance.alertCount, 0)
    XCTAssertTrue(sut.alertContainer.isHidden)
  }

  func testWhenAlertsPosted_alertContainerIsShown() {
    // given
    let exp = expectation(forNotification: AlertNotification.name,
                          object: nil, handler: nil)
    let alert = Alert("show the container")

    // when
    AlertCenter.instance.postAlert(alert: alert)

    // then
    wait(for: [exp], timeout: 1)
    XCTAssertFalse(sut.alertContainer.isHidden)
  }
}
