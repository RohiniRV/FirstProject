//
//  HomeViewObserver.swift
//  FirstProject
//
//  Created by rvaidya on 16/11/21.
//

import SwiftUI
import Combine

class HomeViewObserver: ObservableObject {
    
    @Published var employeeData = [HomeModel]()
    
    private var cancellables = Set<AnyCancellable>()
    let dataManager: DataManager
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func getEmployeeData() {
        self.dataManager.getData(of: RedundantModel.self, url: "https://reqres.in/api/users?page=2")
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error in getting employeeData \(error)")
                case .finished:
                    print("Finished")
                }
            }) { [weak self] data in
                self?.employeeData = data.data
            }
            .store(in: &cancellables)
    }
    
}
