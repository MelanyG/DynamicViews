//
//  ItemModel.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 2/10/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit
import Foundation

class ItemModel {

    var imageUrl:String
    var image: UIImage
    
    init(dataDictionary:Dictionary<String,String>) {
        imageUrl = dataDictionary["imageUrl"]!
        let url = URL(string: imageUrl)!
        image =  downloadImage(url: url)
    }
    
    func downloadImage(url: URL) -> UIImage {

        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)

            return UIImage(data: data)
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
}
