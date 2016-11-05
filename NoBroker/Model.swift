//
//  Model.swift
//  NoddApp
//
//  Created by Sanjay Mali on 08/10/16.
//  Copyright © 2016 Sanjay. All rights reserved.
//

import UIKit

class Model: NSObject {
    
    let type:String!
    let title:String!
    let lat:String!
    let lon:String!
    let locality:String!
    let image:String!
    let id:Int!
    
    init(type:String!,title:String!,lat:String!,lon:String!,locality:String!,image:String!,id:Int!) {
        self.type = type!
        self.title = title!
        self.lat = lat!
        self.lon = lon!
        self.locality = locality!
        self.image = image!
        self.id = id!
    }
    
}
