 


 //  Created by Sherif Kamal on 1/16/20.
 //  Copyright © 2020 Sherif Kamal. All rights reserved.
 // Foundation
@testable  //  Created by Sherif Kamal on 1/16/20.
 //  Copyright © 2020 Sherif Kamal. All rights reserved.
 // FitNess

extension DataModel {
  
  func setToComplete() {
    goal = 100
    steps = 100
    distance = 1
  }

  func setToCaught() {
    goal = 1000
    distance = 1
    nessie.distance = 10
  }
}
