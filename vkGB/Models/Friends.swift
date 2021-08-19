

import UIKit
import RealmSwift

class Friend: Object {
    @objc dynamic var userName: String = ""
    @objc dynamic var userAvatar: String  = ""
    @objc dynamic var ownerID: String  = ""
    
    init(userName:String, userAvatar:String, ownerID:String) {
        self.userName = userName
        self.userAvatar = userAvatar
        self.ownerID = ownerID
    }
    
    // этот инит обязателен для Object
    required override init() {
        super.init()
    }
}

























//Старые данные
//struct Friends {
//    var userName: String
//    var userAvatar: String
//    //var userPhotos: [UIImage?]
//    var owner_id: String
//}

//    let friendsList = [
//        User(userName: "Коля",
//             userAvatar: (UIImage(named: "person1")),
//             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person3"), UIImage(named: "person4"), UIImage(named: "person5")]),
//        User(userName: "Ваня",
//             userAvatar: (UIImage(named: "person2")),
//             userPhotos: [UIImage(named: "person5"), UIImage(named: "person3"), UIImage(named: "person2")]),
//        User(userName: "Василек",
//             userAvatar: (UIImage(named: "person3")),
//             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person4")]),
//        User(userName: "Juan",
//             userAvatar: (UIImage(named: "person4")),
//             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person3")]),
//        User(userName: "Петров Николай",
//             userAvatar: (UIImage(named: "person5")),
//             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person5")]),
//        User(userName: "Аня",
//             userAvatar: (UIImage(named: "person2")),
//             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person5")]),
//        User(userName: "Иван",
//             userAvatar: (UIImage(named: "person5")),
//             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person3")]),
//        User(userName: "Bob Ib",
//             userAvatar: (UIImage(named: "person3")),
//             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person4"), UIImage(named: "person5")]),
//        User(userName: "Анна",
//             userAvatar: (UIImage(named: "person4")),
//             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person4"), UIImage(named: "person3"), UIImage(named: "person5")])
//    ]
