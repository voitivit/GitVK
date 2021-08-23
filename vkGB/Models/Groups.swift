
import UIKit
import RealmSwift
class Group: Object {
    @objc dynamic var groupName: String = ""
    @objc dynamic var groupLogo: String  = ""
    @objc dynamic var id: Int  = 0
    
    init(groupName: String, groupLogo: String, id: Int) {
        self.groupName = groupName
        self.groupLogo = groupLogo
        self.id = id
    }
    
    // этот инит обязателен для Object
    required override init() {
        super.init()
    }

}
