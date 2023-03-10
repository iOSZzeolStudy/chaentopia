//
//  Task.swift
//  ToDoDemo
//
//  Created by 정채은 on 2023/02/11.
//

import Foundation
import RealmSwift

class Task : Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
