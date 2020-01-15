//
//  CityBikeViewController.swift
//  BisBis
//
//  Created by Yakup Ad on 3.03.2019.
//  Copyright © 2019 Yakup Ad. All rights reserved.
//

import UIKit

class CityBikeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Citybikes().GetNetworks()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
