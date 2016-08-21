//
//  Plane.swift
//  CatchEmAll
//
//  Created by Michael Dippery on 8/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Plane: Vehicle {
    let maxAltitude: Double
    var altitude: Double {
        didSet {
            if altitude < 0.0 {
                altitude = 0.0
            }

            if altitude > maxAltitude {
                altitude = maxAltitude
            }
        }
    }
    var inFlight: Bool {
        return altitude > 0.0 && speed > 0.0
    }

    init(name: String, weight: Double, maxSpeed: Double, maxAltitude: Double) {
        self.maxAltitude = maxAltitude
        self.altitude = 0.0
        super.init(name: name, weight: weight, maxSpeed: maxSpeed)
    }

    func takeOff() {
        guard !inFlight else { return }
        speed = maxSpeed * 0.1
        altitude = maxAltitude * 0.1
    }

    func land() {
        speed = 0.0
        altitude = 0.0
    }

    func climb() {
        guard inFlight else { return }
        altitude += (maxAltitude / 10.0)
        super.decelerate()
    }

    func dive() {
        guard inFlight else { return }
        altitude -= (maxAltitude / 10.0)
        super.accelerate()
    }

    func bankRight() {
        guard inFlight else { return }
        heading += 45.0
        speed *= 0.9
    }

    func bankLeft() {
        guard inFlight else { return }
        heading -= 45.0
        speed *= 0.9
    }
}
