//
//  DataShape.swift
//  diet_app
//
//  Created by Karol Korzeń on 02/06/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import Foundation
import UIKit

struct training: Identifiable {
    var id = UUID()
    var title: String!
    var image: UIImage?
    var days = [dayT]()
}

struct dayT: Identifiable {
    var id = UUID()
    var date: String!
    var exercises = [exercise]()
}

struct exercise: Identifiable {
    var id = UUID()
    var name: String!
    var insets=[inset]()
    var number: Int?
    var repetitions: Double?
    var weight: Double?
}

struct inset: Identifiable {
    var id = UUID()
    var number: Int!
    var repetitions: Double!
    var weight: Double!
}

struct diet: Identifiable {
    var id = UUID()
    var title: String!
    var image: UIImage?
    var days = [day]()
}

struct day: Identifiable {
    var id = UUID()
    var date: String!
    var meals = [meal]()
}

struct meal: Identifiable {
    var id = UUID()
    var name: String!
    var ingredients = [ingredient]()
    var calories: String?
}

struct ingredient: Identifiable {
    var id = UUID()
    var name: String!
    var calories: Double!
    var scale: String!
    var quantity: Double!
}

func countCalories(ingrediends_: [ingredient]) -> Double {
    var sum = 0.0
    for ingredient_ in ingrediends_ {
        if(ingredient_.scale=="grams"){
            sum += ingredient_.calories * ingredient_.quantity / 100
        } else {
            sum += ingredient_.calories * ingredient_.quantity
        }
    }
    return sum
}

