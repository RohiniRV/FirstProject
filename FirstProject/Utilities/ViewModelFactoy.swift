//
//  ViewModelFactoy.swift
//  FirstProject
//
//  Created by rvaidya on 16/11/21.
//

import Foundation

class ViewModelFactory {
    
    let dataManager = DataManager()

    func getHomeViewModel() -> HomeViewObserver {
        return HomeViewObserver(dataManager: dataManager)
    }
    
}
