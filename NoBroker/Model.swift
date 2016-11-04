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
    
    init(type:String!,title:String!,lat:String!,lon:String!,locality:String!,image:String!) {
        self.type = type!
        self.title = title!
        self.lat = lat!
        self.lon = lon!
        self.locality = locality!
        self.image = image!
    }
    
}
