//
//  DietViews.swift
//  diet_app
//
//  Created by Karol Korzeń on 03/06/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import Foundation

import SwiftUI

/******     DIET     ******/

struct IngredientView: View {
    var ingredient_ : ingredient
    var body: some View {
        VStack{
            Text(ingredient_.name)
            Text(ingredient_.quantity.description + " " + ingredient_.scale)
            if ((ingredient_.calories) != nil){
                Text(ingredient_.calories!.description + " kcal")
            }
        }
    }
}

struct MealView: View {
    @State var meal_ : meal
    var sum = 0.0
    var body: some View {
        VStack{
            Text(meal_.name)
            Text(String(countCalories(ingrediends_: meal_.ingredients))+" kcal")
            List {
                AddIngredientView(ingredients__: $meal_.ingredients)
                ForEach(meal_.ingredients) { ingredient in
                    NavigationLink(destination: IngredientView(ingredient_: ingredient)) {
                        RowView(text: ingredient.name)
                    }
                }
                .onDelete(perform: delete)
                
            }
            .navigationBarItems(trailing: EditButton())
            
        }
                    
    }
    func delete(at offset: IndexSet) {
        if let first = offset.first {
            vibrate()
            meal_.ingredients.remove(at: first)
        }
    }
}

struct DayView: View {
    
    @State var day_: day
    var body: some View {
        VStack{
            Text(day_.date)
            List {
                AddMealView(meals_: $day_.meals)
                ForEach(day_.meals) { meal in
                    NavigationLink(destination: MealView(meal_: meal)) {
                        RowView(text: meal.name)
                    }
                }
                .onDelete(perform: delete)
                
            }
            .navigationBarItems(trailing: EditButton())
            
        }
                    
    }
    func delete(at offset: IndexSet) {
        if let first = offset.first {
            day_.meals.remove(at: first)
        }
    }
}

struct DietView: View {
    @State var dietContainer_: diet
    var body: some View {
        
            ZStack{
                List {
                    AddDietDayView(day_: $dietContainer_.days)
                    ForEach(dietContainer_.days){ day in
                        NavigationLink(destination: DayView(day_: day), label: {
                            RowView(text: day.date)
                        })
                    }
                    .onDelete(perform: deleteDay)
                    
                }
                .navigationBarItems(trailing: EditButton())
                
            }
        
    }
    func deleteDay(at offset: IndexSet) {
        if let first = offset.first {
            dietContainer_.days.remove(at: first)
        }
    }
}

/******     DIET     ******/

struct AddDietDayView: View {
    @State var title_n : String = ""
    @State var title_n1: String = ""
    @State var title_n2: String = ""
    @Binding var day_: [day]
    var body: some View {
        ZStack{
            Color.flatDarkCardBackground
            .cornerRadius(20)
            HStack{
                TextField("Type new diet day here..", text: $title_n)
                    .padding()
                
                Button(action: {
                    self.day_.append(day(id: UUID(), date: self.title_n, meals: []))
                }) {
                    Image(systemName: "text.badge.plus")
                        .font(.title)
                }
                .font(.callout)
                .foregroundColor(Color.yellow)
            .padding()
            }
        }
        .frame(width: .none, height: 100, alignment: .center)
    }
}


struct AddIngredientView: View {
    @State var title_n : String = ""
    @State var title_n1 : String = ""
    @State var title_n2 : String = ""
    @State var title_n3 : String = ""
    @Binding var ingredients__: [ingredient]
    var body: some View {
        ZStack{
            Color.flatDarkCardBackground
            .cornerRadius(20)
            HStack{
                VStack{
                TextField("name", text: $title_n)
                    .padding()
                TextField("kcal", text: $title_n1)
                .padding()
                }
                VStack{
                TextField("scale", text: $title_n2)
                .padding()
                TextField("quantity", text: $title_n3)
                .padding()
                }
                
                

                
                
                Button(action: {
                    self.ingredients__.append(ingredient(id: UUID(), name: self.title_n, calories: Double(self.title_n1), scale: self.title_n2, quantity: Double(self.title_n3)))
                }) {
                    Image(systemName: "text.badge.plus")
                        .font(.title)
                }
                .font(.callout)
                .foregroundColor(Color.yellow)
            .padding()
            }
        }
        .frame(width: .none, height: 150, alignment: .center)
        .foregroundColor(test() ? .blue : nil)
        .font(test() ? .title : nil)
        .animation(.interactiveSpring())

    }
    
    func test () -> Bool {
        return self.title_n.count>0 && self.title_n1.count>0 && self.title_n2.count>0 && self.title_n3.count>0
    }
}

struct AddMealView: View {
    @State var title_n : String = ""
    @Binding var meals_: [meal]
    var body: some View {
        ZStack{
            Color.flatDarkCardBackground
            .cornerRadius(20)
            HStack{
                TextField("Type new meal name here..", text: $title_n)
                    .padding()
                
                Button(action: {
                    self.meals_.append(meal(id: UUID(), name: self.title_n, ingredients: []))
                }) {
                    Image(systemName: "text.badge.plus")
                        .font(.title)
                }
                .font(.callout)
                .foregroundColor(Color.yellow)
            .padding()
            }
        }
        .frame(width: .none, height: 100, alignment: .center)
    }
}





struct DietViews_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
