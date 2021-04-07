//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultAnimalEmoji: UILabel!
    @IBOutlet weak var resultAnimalText: UILabel!
    
    var choosenAnswers: [AnimalType] = []
    var resultAnimal: AnimalType!
    
    // 1. Передать сюда массив с ответами -
    // 2. Определить наиболее часто встречающийся тип животного -
    // 3. Отобразить результат в соответсвии с этим животным -
    // 4. Избавиться от кнопки возврата назад на экране результатов -

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        resultAnimal = determiningTheMostCommonAnimal(choosenAnswers: choosenAnswers)
        setResultVC(for: resultAnimal)
    }
}

extension ResultsViewController { // Нашел вот такое решение, код понимаю
    private func determiningTheMostCommonAnimal(choosenAnswers: [AnimalType]) -> AnimalType {
        var counters = [AnimalType: Int]()
        
        for c in choosenAnswers {
            counters[c] = (counters[c] ?? 0 ) + 1
        }
        let maxElement = counters.reduce(counters.first!) { $1.1 > $0.1 ? $1 : $0 }
        return maxElement.0
    }
    
    // Но проще понимаю поддаются подобные алгоритмы(закоментированный):
    
//    private func determiningTheMostCommonAnimalTwoCycle(choosenAnswers: [Answer]) -> Answer {
//        var checkCounter = 0
//        var mostAnimal: Answer!
//        for answer in choosenAnswers {
//            var counter = 0
//            for answerIn in choosenAnswers {
//                if answer.type == answerIn.type {
//                    counter += 1
//                }
//            }
//            if counter > checkCounter {
//            checkCounter = counter
//                mostAnimal = answer
//            }
//        }
//        return mostAnimal
//    }
    
    private func setResultVC(for animal: AnimalType) {
        resultAnimalEmoji.text = "Вы - \(animal.rawValue)"
        resultAnimalText.text = animal.definition
    }
    
}
