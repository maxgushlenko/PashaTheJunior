//
//  DataManager.swift
//  Belaz
//
//  Created by Maksim Gushlenko on 5/1/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit

final class DataManager: NSObject {

    static let shared = DataManager()

    override init() {
        super.init()

        createBelazData()
    }

    var belazes: [Belaz]!

    private func createBelazData() {
        belazes = []

        let disielYamz = Belaz(name: "7540", imageName: "7540.jpg", type: .disielYamz, capacity: 20)
        belazes.append(disielYamz)

        let disielCummins = Belaz(name: "7544", imageName: "7544.jpg", type: .disielCummins, capacity: 30)
        belazes.append(disielCummins)

        let disielMTU = Belaz(name: "7545", imageName: "7545.jpg", type: .disielMTU, capacity: 35)
        belazes.append(disielMTU)

        let disielMTU2 = Belaz(name: "7547", imageName: "7547.jpg", type: .disielMTU, capacity: 35)
        belazes.append(disielMTU2)
    }

}
