//
//  ModelData.swift
//  Pods
//
//  Created by Kirill Drozdov on 10.12.2021.
//

import RealmSwift


@objcMembers
class ModeslData: Object{ // вынести потом в отдельный класс
      dynamic var task:     String = ""
      dynamic var deadLine: String = ""
}


