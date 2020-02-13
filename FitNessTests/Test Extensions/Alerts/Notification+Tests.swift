 

 //  Created by Sherif Kamal on 1/16/20.
 //  Copyright © 2020 Sherif Kamal. All rights reserved.
 // Foundation
@testable  //  Created by Sherif Kamal on 1/16/20.
 //  Copyright © 2020 Sherif Kamal. All rights reserved.
 // FitNess

extension Notification {
  var alert: Alert? {
    return userInfo?[AlertNotification.Keys.alert] as? Alert
  }
}
