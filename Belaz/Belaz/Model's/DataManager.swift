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

        let belaz7540 = Belaz(name: "7540", imageName: "7540.jpg", type: .disielYamz, capacity: 20, isChoose: false)
        belazes.append(belaz7540)

        let belaz7544 = Belaz(name: "7544", imageName: "7544.jpg", type: .disielCummins, capacity: 30, isChoose: false)
        belazes.append(belaz7544)

        let belaz7545 = Belaz(name: "7545", imageName: "7545.jpg", type: .disielMTU, capacity: 35, isChoose: false)
        belazes.append(belaz7545)

        let belaz7547 = Belaz(name: "7547", imageName: "7547.jpg", type: .disielMTU, capacity: 40, isChoose: false)
        belazes.append(belaz7547)

        let belaz7555 = Belaz(name: "7555", imageName: "7555.jpg", type: .disielCummins, capacity: 55, isChoose: false)
        belazes.append(belaz7555)
    }

}
