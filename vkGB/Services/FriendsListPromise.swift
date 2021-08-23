//
//  FriendsListPromise.swift
//  Client VK
//
//  Created by emil kurbanov on 12.08.2021.

import Foundation
import PromiseKit

class FriendsListPromise {
    
    func getData() {
        firstly {
            loadJsonData()
        }.then { data in
            self.parseJsonData(data)
        }.done { friendList in
            self.saveDataToRealm(friendList)
        }.catch { error in
            print(error)
        }
//        .finally {
//            print("Загрузка, парсинг и запись в реалм прошли успешно")
//        }
    }
    
    func loadJsonData() -> Promise<Data> {
        return Promise<Data> { (resolver) in
            let configuration = URLSessionConfiguration.default
            let session =  URLSession(configuration: configuration)
            var urlConstructor = URLComponents()
            urlConstructor.scheme = "https"
            urlConstructor.host = "api.vk.com"
            urlConstructor.path = "/method/friends.get"
            urlConstructor.queryItems = [
                URLQueryItem(name: "user_id", value: String(Session.instance.userId)),
                URLQueryItem(name: "fields", value: "photo_50"),
                URLQueryItem(name: "access_token", value: Session.instance.token),
                URLQueryItem(name: "v", value: "5.122")
            ]
            
            session.dataTask(with: urlConstructor.url!) { (data, _, error) in
                //print("Запрос к API: \(urlConstructor.url!)")
                if let error = error {
                    return resolver.reject(error)
                } else {
                    return resolver.fulfill(data ?? Data())
                }
            }.resume()
        }
    }
    
    
    func parseJsonData(_ data: Data) -> Promise<[Friend]> {
        return Promise<[Friend]> { (resolver) in
            do {
                let arrayFriends = try JSONDecoder().decode(FriendsResponse.self, from: data)
                var friendList: [Friend] = []
                for i in 0...arrayFriends.response.items.count-1 {
                    // не отображаем удаленных и заблокированных друзей
                    if arrayFriends.response.items[i].deactivated == nil {
                        let name = ((arrayFriends.response.items[i].firstName) + " " + (arrayFriends.response.items[i].lastName))
                        let avatar = arrayFriends.response.items[i].avatar
                        let id = String(arrayFriends.response.items[i].id)
                        friendList.append(Friend.init(userName: name, userAvatar: avatar, ownerID: id))
                    }
                }
                resolver.fulfill(friendList)
            } catch let error {
                resolver.reject(error)
            }
        }
    }
    
    func saveDataToRealm(_ friendList: [Friend]) {
        //DispatchQueue.main.async {
            RealmOperations().saveFriendsToRealm(friendList)
        //}
    }
    
}
