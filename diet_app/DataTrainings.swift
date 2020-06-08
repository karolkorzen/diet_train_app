//
//  DataTrainings.swift
//  diet_app
//
//  Created by Karol Korzeń on 02/06/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import Foundation

var trainingsContainer = [fBW,pUSH]

var fBW = training(title: "Full Body Workout", image: nil, days: [dayt1, dayt2])
var pUSH = training(title: "Push Workout", image: nil, days: [dayt1])

var dayt1=dayT(date: "22.05.2020", exercises: [martwy, wyciskanie])
var dayt2=dayT(date: "25.05.2020", exercises: [przysiad, hantlebic])

var martwy = exercise(name: "Martwy Ciąg", insets: [inset31,inset32,inset33],number: 3, repetitions: 5, weight: 120)
var wyciskanie = exercise(name: "Wyciskanie leżąc", insets: [inset41,inset42,inset43],number: 3, repetitions: 5, weight: 90)
var przysiad = exercise(name: "Przysiad ze sztangą", insets: [inset21,inset22,inset23,inset24,inset25],number: 5, repetitions: 5, weight: 70)
var hantlebic = exercise(name: "Przyciąganie hantli", insets:[inset11,inset12,inset13],number: 3, repetitions: 8, weight: 15)

var inset11=inset(number: 1, repetitions: 8, weight: 15)
var inset12=inset(number: 2, repetitions: 8, weight: 15)
var inset13=inset(number: 3, repetitions: 6, weight: 15)

var inset21=inset(number: 1, repetitions: 5, weight: 60)
var inset22=inset(number: 2, repetitions: 5, weight: 65)
var inset23=inset(number: 3, repetitions: 5, weight: 70)
var inset24=inset(number: 4, repetitions: 5, weight: 70)
var inset25=inset(number: 5, repetitions: 4, weight: 72.5)

var inset31=inset(number: 1, repetitions: 5, weight: 120)
var inset32=inset(number: 2, repetitions: 5, weight: 120)
var inset33=inset(number: 3, repetitions: 5, weight: 125)

var inset41=inset(number: 1, repetitions: 5, weight: 90)
var inset42=inset(number: 2, repetitions: 5, weight: 90)
var inset43=inset(number: 3, repetitions: 5, weight: 90)
