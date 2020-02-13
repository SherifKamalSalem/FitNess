 


 //  Created by Sherif Kamal on 1/16/20.
 //  Copyright © 2020 Sherif Kamal. All rights reserved.
 // Foundation
@testable  //  Created by Sherif Kamal on 1/16/20.
 //  Copyright © 2020 Sherif Kamal. All rights reserved.
 // FitNess

extension AppModel {

  func setToComplete() {
    dataModel.setToComplete()
    try! setCompleted()
  }

  func setToCaught() {
    dataModel.setToCaught()
    try! setCaught()
  }
}
