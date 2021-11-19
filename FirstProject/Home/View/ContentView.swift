//
//  ContentView.swift
//  FirstProject
//
//  Created by rvaidya on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var homeDataObserver: HomeViewObserver
    
    var body: some View {
        List(homeDataObserver.employeeData, id: \.id) { value in
            Text("\(value.first_name)")
        }
        .onAppear {
            homeDataObserver.getEmployeeData()
            print("Values \(homeDataObserver.employeeData)")
        }
        .navigationTitle(Text("Employees"))
        .navigationBarHidden(true)
    }
}

//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(homeDataObserver: <#HomeViewObserver#>)
//    }
//}
