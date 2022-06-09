//
//  FitnessData.swift
//  GridWithTabView
//
//  Created by haeryu on 2022/06/08.
//

import Foundation

struct Fitness: Identifiable {
    var id : Int
    var title : String
    var image : String
    var data : String
    var suggest : String
}

var day_Fit_Data = [
    
    Fitness(id: 0, title: "Hear Rate", image: "heart", data: "124 bpm", suggest: "80-120\nHealthy"),
    Fitness(id: 1, title: "Sleep", image: "sleep", data: "6h 23m", suggest: "DeepSleep\n5h 13m"),
    Fitness(id: 2, title: "Energy Burn", image: "energy", data: "583 kcal", suggest: "Daily Goal\n4,800 kacl"),
    Fitness(id: 3, title: "Steps", image: "steps", data: "17,874", suggest: "Daily Goal\n20,000 Steps"),
    Fitness(id: 4, title: "Running", image: "running", data: "5.6 km", suggest: "Daily Goal\n10 km"),
    Fitness(id: 5, title: "Cycling", image: "cycle", data: "15.4 km", suggest: "Daily Goal\n20 km")

]

var week_Fit_Data = [
    
    Fitness(id: 0, title: "Hear Rate", image: "heart", data: "111 bpm", suggest: "80-120\nHealthy"),
    Fitness(id: 1, title: "Sleep", image: "sleep", data: "43h 23m", suggest: "DeepSleep\n26h 13m"),
    Fitness(id: 2, title: "Energy Burn", image: "energy", data: "3,500 kcal", suggest: "Weekly Goal\n4,800 kacl"),
    Fitness(id: 3, title: "Steps", image: "steps", data: "178,741", suggest: "Weekly Goal\n250,000 Steps"),
    Fitness(id: 4, title: "Running", image: "running", data: "45.6 km", suggest: "Weekly Goal\n70 km"),
    Fitness(id: 5, title: "Cycling", image: "cycle", data: "100.4 km", suggest: "Weekly Goal\n120 km")

]

var month_Fit_Data = [
    
    Fitness(id: 0, title: "Hear Rate", image: "heart", data: "100 bpm", suggest: "80-120\nHealthy"),
    Fitness(id: 1, title: "Sleep", image: "sleep", data: "43h 23m", suggest: "DeepSleep\n23h 13m"),
    Fitness(id: 2, title: "Energy Burn", image: "energy", data: "3,500 kcal", suggest: "Goal\n4,800 kacl"),
    Fitness(id: 3, title: "Steps", image: "steps", data: "17,8741", suggest: "Goal\n25,0000 Steps"),
    Fitness(id: 4, title: "Running", image: "running", data: "5.6 km", suggest: "Goal\n10 km"),
    Fitness(id: 5, title: "Cycling", image: "cycle", data: "15.4 km", suggest: "Goal\n20 km")

]
