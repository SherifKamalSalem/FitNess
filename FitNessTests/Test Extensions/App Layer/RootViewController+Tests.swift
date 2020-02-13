 

 //  Created by Sherif Kamal on 1/16/20.
 //  Copyright © 2020 Sherif Kamal. All rights reserved.
 // UIKit
@testable import FitNess  //  Created by Sherif Kamal on 1/16/20.
 //  Copyright © 2020 Sherif Kamal. All rights reserved.
 // FitNess

extension RootViewController {
  var stepController: StepCountController {
    return children.first { $0 is StepCountController }
      as! StepCountController
  }
}
