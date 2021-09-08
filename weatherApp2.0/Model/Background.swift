//
//  background.swift
//  weatherApp2.0
//
//  Created by F1xTeoNtTsS on 07.09.2021.
//

import UIKit

struct Background {
    let backgroundView: UIImageView = {
        let bView = UIImageView(frame: UIScreen.main.bounds)
        bView.image = UIImage(named: "background")
        bView.contentMode = .scaleAspectFill
        return bView
    }()
}


