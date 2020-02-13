 

 //  Created by Sherif Kamal on 1/16/20.
 //  Copyright © 2020 Sherif Kamal. All rights reserved.

 import Foundation
struct AlertNotification {
  static let name = Notification.Name("Alert")

  enum Keys: String {
    case alert
    case statusChange
  }

  enum AlertChangeStatus {
    case added, cleared
  }

  private init() {}
}
