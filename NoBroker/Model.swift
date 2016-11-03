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
    
    init(type:String!,title:String!,lat:String!,lon:String!) {
        self.type = type!
        self.title = title!
        self.lat = lat!
        self.lon = lon!
    }
    
}
