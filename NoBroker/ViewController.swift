//
//  ViewController.swift
//  NoBroker
//
//  Created by Sanjay Mali on 03/11/16.
//  Copyright © 2016 Sanjay. All rights reserved.
//

import UIKit
//import GoogleMaps
import SwiftyJSON
class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    var m = [Model]()
//    var locationManager: CLLocationManager!
    var didanimateCamera:Bool = true
    @IBOutlet var collectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "NoBroker"
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.sizeToFit()
//        setupCollectionView()
        
//        self.collectionView.showsHorizontalScrollIndicator = true
//        self.collectionView.showsVerticalScrollIndicator  = false
        readJSON()
//        let c = GMSCameraPosition.camera(withLatitude:19.0760, longitude:72.4777, zoom: 7)
//        map_View = GMSMapView.map(withFrame: .zero, camera: c)
//        view = map_View
//        map_View.delegate = self
//        constrain()
//        get()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.layer.cornerRadius = 3.0
        cell.layer.masksToBounds = true
        
        
        return cell
    }
    
        func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 8.0
//        layout.minimumInteritemSpacing = 8.0
//        self.collectionView!.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
//        self.collectionView!.alwaysBounceVertical = true
//        self.collectionView!.collectionViewLayout = layout
        layout.scrollDirection = .vertical
        
    }


    
    
    
//    func constrain(){
//        map_View.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
//        map_View.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
//        map_View.heightAnchor.constraint(equalTo:view.heightAnchor,multiplier:1/3).isActive = true
//        map_View.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
////        mapView.bottomAnchor.constraint(equalTo:view.bottomAnchor,constant:-150).isActive = true
//    }
//    var map_View: GMSMapView = {
//        let view = GMSMapView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
    func readJSON(){
        if let path : String = Bundle.main.path(forResource: "JSONFile", ofType: "txt") {
            if let data = NSData(contentsOfFile: path) {
                let json = JSON(data: data as Data)
                let data = json["data"].array!
                for i in data {
                    let title = i["title"].string
                    let type = i["type"].string
                    let cor = i ["coordinate"].string!
                    let coordinate = cor.components(separatedBy:",")
                    let lat = coordinate[0]
                    let lon = coordinate[1]
                    let  response = Model(type:type!,title:title!,lat:lat,lon:lon)
                    self.m.append(response)
                    
                }
            }
            
        }
    }
//    func get(){
//        for index in self.m {
//            self.setMarkersOnMap((index.lat as NSString).doubleValue, lng: (index.lon as NSString).doubleValue, title: index.type, snipet:"", item: index)
//        }
//        
//    }
    
//    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
////        let vc = Detailed_ViewController()
////        print("didTapInfoWindowOf")
////        let model = marker.userData as! Model
////        
////        vc.nType = model.type
////        vc.nEvent = model.title
////        vc.nlatlong = model.lat + "," + model.lon
////        self.navigationController?.pushViewController(vc, animated: true)
////        
//    }
//    
//    func setMarkersOnMap(_ lat: Double, lng: Double , title: String , snipet: String, item:Model) {
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(lat, lng)
//        if item.type == "ex"{
//            marker.title = title
//            marker.isFlat = true
//            marker.icon = UIImage(named: "red")
//            marker.map = map_View
//            marker.userData = item
//            
//        }else if item.type == "pe"{
//            marker.title = title
//            marker.isFlat = true
//            marker.icon = UIImage(named: "voilet")
//            marker.map = map_View
//            marker.userData = item
//            
//        }else{
//            marker.title = title
//            marker.isFlat = true
//            marker.icon = UIImage(named: "black")
//            marker.map = map_View
//            marker.userData = item
//            
//        }
//        
//    }
//

}

