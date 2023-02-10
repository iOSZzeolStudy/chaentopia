/**
 * Copyright (c) 2018 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let rayGreen = UIColor(named: "rayGreen")
    UITextField.appearance().tintColor = rayGreen
    UITextView.appearance().tintColor = rayGreen
      
//      let config = Realm.Configuration(
//                  schemaVersion: 2, // 새로운 스키마 버전 설정
//                  migrationBlock: { migration, oldSchemaVersion in
//                      if oldSchemaVersion < 2 {
//                          // 1-1. 마이그레이션 수행(버전 2보다 작은 경우 버전 2에 맞게 데이터베이스 수정)
//                          migration.enumerateObjects(ofType: Specimen.className()) { oldObject, newObject in
//                              newObject!["longitude"] = 0.0
//                          }
//                      }
//                  }
//              )
//
//              // 2. Realm이 새로운 Object를 쓸 수 있도록 설정
//              Realm.Configuration.defaultConfiguration = config
      
      let schemaVersion = UInt64(20000)
       
      let config = Realm.Configuration(
          //  Change schema version value if want generate new migration
          schemaVersion: schemaVersion,
          migrationBlock: { migration, oldSchemaVersion in
              if oldSchemaVersion < (schemaVersion - UInt64(1)) {
                  // Nothing to do!
                  // Realm will automatically detect new properties and removed properties
                  // And will update the schema on disk automatically
              }
          }
      )
      Realm.Configuration.defaultConfiguration = config

    return true
  }
}
