 
 //  Created by Sherif Kamal on 1/16/20.
 //  Copyright © 2020 Sherif Kamal. All rights reserved.

import Foundation
@testable import FitNess

extension Notification {
  var alert: Alert? {
    return userInfo?[AlertNotification.Keys.alert] as? Alert
  }
}
