//
//  PlaceView.swift
//  TrevalRandomizer_IOS
//
//  Created by Alexey on 11/21/19.
//  Copyright © 2019 Алексей. All rights reserved.
//

import Foundation
import UIKit


class PlaceView: HistoryView {

    @IBOutlet var imageView : UIImageView!
    @IBOutlet var infOfPlace: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if indexTap != 0 {
        let place = placeList[indexTap]
        imageView.image = URLRequest(url: place.value(forKey: "imageData") as! URL) as? UIImage
        infOfPlace.text = place.value(forKey: "infoData") as? String
        }

    }
}
