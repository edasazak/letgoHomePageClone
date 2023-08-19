//
//  Ilanlar.swift
//  LetgoHomePage
//
//  Created by Mac on 19.08.2023.
//

import Foundation

class Ilanlar {
    var image: String?
    var fiyat: String?
    var name: String?
    var km: String?
    
    init(image: String, fiyat: String?, name: String, km: String?) {
        self.image = image
        self.fiyat = fiyat
        self.name = name
        self.km = km
    }
}
