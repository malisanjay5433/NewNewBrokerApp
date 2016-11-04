//
//  ViewController.swift
//  NoBroker
//
//  Created by Sanjay Mali on 03/11/16.
//  Copyright © 2016 Sanjay. All rights reserved.
//

import UIKit
import GoogleMaps
import SwiftyJSON
class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CLLocationManagerDelegate , GMSMapViewDelegate {
    var m = [Model]()
    var locationManager: CLLocationManager!
    var didanimateCamera:Bool = true
    @IBOutlet var collectionView:UICollectionView!
     @IBOutlet var map_View:GMSMapView?
    @IBOutlet var back:UIView?
    @IBOutlet var collection_back:UIView?
    var titleLabel = UILabel()
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        readJSON()
        
        titleLabel = UILabel(frame: CGRect(x:0, y:0, width:view.frame.width - 32, height:view.frame.height))
        titleLabel.text = "Mumbai"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        navigationItem.titleView = titleLabel
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let c = GMSCameraPosition.camera(withLatitude:19.0760, longitude:73.1777, zoom:10)
//        map_View = GMSMapView.map(withFrame:.zero , camera: c)
        map_View = GMSMapView.map(withFrame: CGRect(x:0,y:0,width:self.view.bounds.width,height:self.view.bounds.height - 150), camera:c)
        back?.addSubview(map_View!)
        map_View?.isMyLocationEnabled = true
//        map_View?.settings.myLocationButton = true
        map_View?.delegate = self
      
    }
    
//    
//    var map_View: GMSMapView = {
//        let view = GMSMapView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func clear_Button(){
        
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Property_Cell
        let data = m[indexPath.row]
        cell.property_Name?.text = data.type
        cell.locality?.text = data.title
        cell.bhk?.text = data.locality
        cell.property_Image?.image = UIImage(named:data.image)
        cell.layer.cornerRadius = 3.0
//        cell.layer.masksToBounds = true
        let shadowPath = UIBezierPath(rect: cell.bounds)
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        cell.layer.shadowOpacity = 2
        cell.layer.shadowPath = shadowPath.cgPath
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = m[indexPath.row]
        index = indexPath.row
        titleLabel.text = data.locality
        self.setMarkersOnMap((data.lat as NSString).doubleValue, lng: (data.lon as NSString).doubleValue, title: data.title, snipet:"", item: data)
        let zoomCamera = GMSCameraUpdate.zoomIn()
        map_View?.animate(with: zoomCamera)
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
                    let loc = i ["locality"].string!
                    let image = i["image"].string
                    let  response = Model(type:type!,title:title!,lat:lat,lon:lon,locality:loc,image:image!)
                    self.m.append(response)
                    
                }
            }
            
        }
    }
//    func get(){
//        let data:Model?
//        self.setMarkersOnMap((data?.lat as NSString).doubleValue, lng: (data?.lon as NSString).doubleValue, title: data?.title, snipet:"", item:"")
//     
//    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
//        let vc = Detailed_ViewController()
        print("didTapInfoWindowOf")
        let model = marker.userData as! Model
        
//        vc.nType = model.type
//        vc.nEvent = model.title
//        vc.nlatlong = model.lat + "," + model.lon
//        self.navigationController?.pushViewController(vc, animated: true)
//        let index = NSIndexPath()
        print("index:\(self.index)")
    }
    
    
    func setMarkersOnMap(_ lat: Double, lng: Double , title: String , snipet: String, item:Model) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(lat, lng)
//        let vancouver = CLLocationCoordinate2D(latitude: lat, longitude: lat)
//
//        let vancouverCam = GMSCameraUpdate.setTarget(vancouver)
//        map_View?.animate(with: vancouverCam)
        map_View?.camera = GMSCameraPosition.camera(withLatitude:lat, longitude:lng, zoom:11)
            marker.title = title
            marker.map = map_View
            marker.icon = UIImage(named: "home")
            marker.userData = item
        }
    
    func drawCircle(_ position: CLLocationCoordinate2D) {

        let circle = GMSCircle(position: position, radius: 2000)
        circle.strokeColor = UIColor.blue
        circle.fillColor = UIColor(red: 0, green: 0, blue: 0.35, alpha: 0.05)
        circle.map = map_View
        
    }


}
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

