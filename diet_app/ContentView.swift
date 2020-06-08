//
//  ContentView.swift
//  diet_app
//
//  Created by Karol Korzeń on 02/06/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import SwiftUI
import LocalAuthentication

struct AllListView: View {
    @State var trainings_ = trainingsContainer
    @State var diets_ = dietsContainer
    @State var clicked = false
    @State var logged = false
    var body: some View {
        
        NavigationView{
            ZStack{
            if self.logged {
             List {
                Section(header: Text("Trainings")) {
                    
                        ForEach(trainings_){ training in
                            NavigationLink(destination: TrainingView(fbW: training)) {
                                RowView(text: training.title)
                            }
                        }
                        .onDelete(perform: deleteTraining)
                    AddTrainingView(trainings_: $trainings_)
               }

               Section(header: Text("Diets")) {
                  ForEach(diets_){ diet in
                       NavigationLink(destination: DietView(dietContainer_: diet)) {
                        RowView(text: diet.title)
                       }
                   }
               .onDelete(perform: deleteDiet)
                AddDietView(diets_: $diets_)
               }
            }
             .navigationBarItems(trailing: EditButton())
             .navigationBarTitle(Text("Home"))
            }
            else {
                Button("Try again") {
                    self.authenticate()
                }
                }
            }
        .onAppear(perform: authenticate)
        }
    }
    
    func deleteTraining(at offset: IndexSet) {
        if let first = offset.first {
            trainings_.remove(at: first)
        }
    }
    func deleteDiet(at offset: IndexSet) {
        if let first = offset.first {
            diets_.remove(at: first)
        }
    }
    
    func authenticate(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "I need to confirm its you"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in DispatchQueue.main.async {
                if success {
                    self.logged=true
                } else {
                    
                }
                }
            }
        }
    }
}

struct AddDietView: View {
    @State var title_n : String = ""
    @Binding var diets_ : [diet]
    var body: some View {
        ZStack{
            Color.flatDarkCardBackground
            .cornerRadius(20)
            HStack{
                TextField("Type new diet title here..", text: $title_n)
                    .padding()
                
                Button(action: {
                    self.diets_.append(diet(id: UUID(), title: self.title_n, image: nil, days: []))
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

struct AddTrainingView: View {
    @State var title_n : String = ""
    @State var clicked = false
    @Binding var trainings_ : [training]
    var body: some View {
        ZStack{
            Color.flatDarkCardBackground
            .cornerRadius(20)
            HStack{
                TextField("Type new training title here..", text: $title_n)
                    .padding()
                
                Button(action: {
                    if (self.title_n.count==0){
                        self.clicked.toggle()
                    } else {
                    self.trainings_.append(training(id: UUID(), title: self.title_n, image: nil, days: []))
                    }
                }) {
                    Image(systemName: "text.badge.plus")
                        .font(.title)
                }
            .actionSheet(isPresented: $clicked, content: {
                ActionSheet(title: Text("EMPTY"), message: Text("Field is empty, are you sure you want to add new item?"), buttons: [
                    ActionSheet.Button.default(Text("YES"), action: {
                        self.trainings_.append(training(id: UUID(), title: self.title_n, image: nil, days: []))
                    }),
                    ActionSheet.Button.cancel()
                ])
            })
                .font(.callout)
                .foregroundColor(Color.yellow)
            .padding()
            }
        }
        .frame(width: .none, height: 100, alignment: .center)
    }
}

struct RowView: View {
    var text: String!
    var body: some View{
        ZStack{
            Color.flatDarkCardBackground
                .cornerRadius(20)
            Text(text)
                .font(.callout)
                .fontWeight(.heavy)
                .foregroundColor(Color.yellow)
        }
        .frame(width: .none, height: 100, alignment: .center)
    }
}

struct ContentView: View { 
    
    var body: some View {
        AllListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
