//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//  Edited by Olga Yurchuk on 25.06.2022
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultTitleLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    var chosenAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        
        showResults(result: calculateResult(chosenAnswers: chosenAnswers))
        
    }
    
    // В такой реализации понятно, что плохо масштабируется количество вариантов ответов,
    // но чтобы увеличить количество вариантов и так придётся много чего переделать (кол-во UI элементов, например),
    // поэтому так оставила. Хотя осталось ощущение, что как будто захардкодила где-то лишнее...
    private func calculateResult(chosenAnswers: [Answer]) -> Animal {
    
        var (dogCount, catCount, rabbitCount, turtleCount) = (0, 0, 0, 0)
        
        for answer in chosenAnswers {
            switch answer.animal {
                case .dog: dogCount += 1
                case .cat: catCount += 1
                case .rabbit: rabbitCount += 1
                case .turtle: turtleCount += 1
                }
        }
        
        let results = [dogCount, catCount, rabbitCount, turtleCount]
        let result = results.max()
        
        if dogCount == result { return .dog }
        if catCount == result { return .cat }
        if rabbitCount == result { return .rabbit }
        if turtleCount == result { return .turtle }
        return .dog // потому что Xcode требовал return, он же не знает, что какой-то if должен сработать
        // как обрабатывать одинаковое количество баллов не было сказано, поэтому беру первое совпавшееся
    }
    
    private func showResults(result: Animal) {
        resultTitleLabel.text = "Вы - \(result.rawValue)"
        resultDescriptionLabel.text = result.definition
    }
}
