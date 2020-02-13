 

 //  Created by Sherif Kamal on 1/16/20.
 //  Copyright © 2020 Sherif Kamal. All rights reserved.
 import XCTest
@testable import FitNess  //  Created by Sherif Kamal on 1/16/20.
 //  Copyright © 2020 Sherif Kamal. All rights reserved.
 // FitNess

class AlertCenterTests: XCTestCase {

  var sut: AlertCenter!

  override func setUp() {
    super.setUp()
    sut = AlertCenter()
  }

  override func tearDown() {
    AlertCenter.instance.clearAlerts()
    sut = nil
    super.tearDown()
  }

  func testPostOne_generatesANotification() {
    // given
    let exp = expectation(forNotification: AlertNotification.name,
                          object: sut,
                          handler: nil)
    let alert = Alert("this is an alert")

    // when
    sut.postAlert(alert: alert)

    // then
    wait(for: [exp], timeout: 1)
  }

  func testPostingTwoAlerts_generatesTwoNotifications() {
    //given
    let exp = expectation(forNotification: AlertNotification.name,
                           object: sut,
                           handler: nil)
    exp.expectedFulfillmentCount = 2
    let alert1 = Alert("this is the first alert")
    let alert2 = Alert("this is the second alert")

    // when
    sut.postAlert(alert: alert1)
    sut.postAlert(alert: alert2)

    // then
    wait(for: [exp], timeout: 1)
  }

  func testPostDouble_generatesOnlyOneNotification() {
    //given
    let exp = expectation(forNotification: AlertNotification.name,
                          object: sut,
                          handler: nil)
    exp.expectedFulfillmentCount = 2
    exp.isInverted = true
    let alert = Alert("this is an alert")

    // when
    sut.postAlert(alert: alert)
    sut.postAlert(alert: alert)

    // then
    wait(for: [exp], timeout: 1)
  }

  // MARK: - Alert Count
  func testWhenInitialized_AlertCountIsZero() {
    XCTAssertEqual(sut.alertCount, 0)
  }

  func testWhenAlertPosted_CountIsIncreased() {
    // given
    let alert = Alert("An alert")

    // when
    sut.postAlert(alert: alert)

    // then
    XCTAssertEqual(sut.alertCount, 1)
  }

  func testWhenCleared_CountIsZero() {
    // given
    let alert = Alert("An alert")
    sut.postAlert(alert: alert)

    // when
    sut.clearAlerts()

    // then
    XCTAssertEqual(sut.alertCount, 0)
  }

  // MARK: - Notification Contents
  func testNotification_whenPosted_containsAlertObject() {
    // given
    let alert = Alert("test contents")
    let exp = expectation(forNotification: AlertNotification.name,
                          object: sut, handler: nil)

    var postedAlert: Alert?
    sut.notificationCenter.addObserver(forName: AlertNotification.name,
                                       object: sut, queue: nil)
    { notification in
      postedAlert = notification.alert
    }

    // when
    sut.postAlert(alert: alert)

    // then
    wait(for: [exp], timeout: 1)
    XCTAssertNotNil(postedAlert, "should have an sent an alert")
    XCTAssertEqual(alert, postedAlert, "should have sent the original alert")
  }

  // MARK: - Clearing Individual Alerts
  func testWhenCleared_alertIsRemoved() {
    // given
    let alert = Alert("to be cleared")
    sut.postAlert(alert: alert)

    // when
    sut.clear(alert: alert)

    // then
    XCTAssertEqual(sut.alertCount, 0)
  }
}
