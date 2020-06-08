//
//  TrainingViews.swift
//  diet_app
//
//  Created by Karol Korzeń on 03/06/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import Foundation
import SwiftUI

/******     TRAINING     ******/

struct ExerciseView: View {
    @State var exercise_ : exercise
    
    var body: some View {
        VStack{
            Text(exercise_.name)
            List {
                AddSetView(inset_: $exercise_.insets)
                ForEach(exercise_.insets) { inset in
                    
                    RowView(text: "set "+String(inset.number)+": "+String(inset.repetitions)+"x"+String(inset.weight)+"kg")
                    }
                .onDelete(perform: deleteSet)
                }
            .navigationBarItems(trailing: EditButton())
            }
        }
    
    func deleteSet(at offset: IndexSet) {
        if let first = offset.first {
            exercise_.insets.remove(at: first)
        }
    }
}

struct DayTView: View {
    @State var day_: dayT
    var body: some View {
        VStack{
            Text(day_.date)
            List {
                AddExerciseView(exercises_: $day_.exercises)
                ForEach(day_.exercises) { exercise in
                    NavigationLink(destination: ExerciseView(exercise_: exercise)){
                        RowView(text: exercise.name)
                    }
                }
                .onDelete(perform: deleteExercise)
                
            }
            .navigationBarItems(trailing: EditButton())
            
        }
    }
    
    func deleteExercise(at offset: IndexSet) {
        if let first = offset.first {
            day_.exercises.remove(at: first)
        }
    }
}

struct TrainingView: View {
    @State var fbW: training
    var body: some View {
        
            ZStack{
                List {
                    AddTrainingDayView(dayt_: $fbW.days)
                    ForEach(fbW.days){ day in
                        NavigationLink(destination: DayTView(day_: day)) {
                            RowView(text: day.date)
                        }
                    }
                    .onDelete(perform: deleteDay)
                    
                }
                .navigationBarTitle(Text(fbW.title))
                .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteDay(at offset: IndexSet) {
        if let first = offset.first {
            fbW.days.remove(at: first)
        }
    }

}

/******     TRAINING     ******/

struct AddTrainingDayView: View {
    @State var title_n : String = ""
    @Binding var dayt_ : [dayT]
    var body: some View {
        ZStack{
            Color.flatDarkCardBackground
            .cornerRadius(20)
            HStack{
                TextField("Type new training day here..", text: $title_n)
                    .padding()
                
                Button(action: {
                    self.dayt_.append(dayT(id: UUID(), date: self.title_n, exercises: []))
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

struct AddExerciseView: View {
    @State var title_n : String = ""
    @Binding var exercises_ : [exercise]
    var body: some View {
        ZStack{
            Color.flatDarkCardBackground
            .cornerRadius(20)
            HStack{
                TextField("Type new exercise here..", text: $title_n)
                    .padding()
                
                Button(action: {
                    self.exercises_.append(exercise(id: UUID(), name: self.title_n, insets: [], number: 0, repetitions: 0, weight: 0))
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

struct AddSetView: View {
    @State var title_n : String = ""
    @State var title_n1: String = ""
    @State var title_n2: String = ""
    @Binding var inset_: [inset]
    var body: some View {
        ZStack{
            Color.flatDarkCardBackground
            .cornerRadius(20)
            HStack{
                TextField("set", text: $title_n)
                    .padding()
                TextField("reps", text: $title_n1)
                .padding()
                TextField("weight", text: $title_n2)
                .padding()
                .foregroundColor(compare() ? Color.red : nil)
                
                Button(action: {
                    self.inset_.append(inset(id: UUID(), number: Int(self.title_n), repetitions: Double(self.title_n1), weight: Double(self.title_n2)))
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
    
    func compare() -> Bool {
        let tmp = Double(title_n2) ?? 0.0
        if (tmp/countAVG()>1.5) {
            return true}
        else{ return false}
    }
    
    func countAVG() -> Double {
        var tmp=0.0
        for index in inset_{
            tmp+=index.weight
        }
        return tmp/Double(inset_.count)
    }
}
