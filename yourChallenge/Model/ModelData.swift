//
//  ModelData.swift
//  Pods
//
//  Created by Kirill Drozdov on 10.12.2021.
//

import Foundation
import RealmSwift


@objcMembers
class ModeslData: Object{ // вынести потом в отдельный класс
    @objc  dynamic  var task: String = ""
    @objc  dynamic var deadLine: String = ""
}


