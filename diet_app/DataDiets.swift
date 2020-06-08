//
//  DataDiets.swift
//  diet_app
//
//  Created by Karol Korzeń on 02/06/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import Foundation

var egg = ingredient(name: "Egg", calories: 52, scale: "piece", quantity: 4)
var bread = ingredient(name: "Bread", calories: 350, scale: "slice", quantity: 3)
var butter = ingredient(name: "Butter", calories: 700, scale: "grams", quantity: 20)

var ingredientsContainer1 = [ingredient](arrayLiteral: egg,bread,butter)
var ingredientsContainer2 = [ingredient](arrayLiteral: bread,butter)

var meal1 = meal(name: "Scrumbled eggs", ingredients: ingredientsContainer1)
var meal2 = meal(name: "Simple meal", ingredients: ingredientsContainer2)

var mealsContainer1 = [meal](arrayLiteral: meal1, meal2)
var mealsContainer2 = [meal](arrayLiteral: meal2)

var day1 = day(date: "20.05.2020", meals: mealsContainer1)
var day2 = day(date: "22.05.2020", meals: mealsContainer2)


var daysContainer1 = [day](arrayLiteral: day1, day2)

var diet1 = diet(title: "My Diet", image: nil, days: daysContainer1)

var dietsContainer = [diet1]
