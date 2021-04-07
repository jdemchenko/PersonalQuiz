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
    
    var choosenAnswers: [Answer]!
    var resultAnimal: Answer!
    
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

extension ResultsViewController {
    private func determiningTheMostCommonAnimal(choosenAnswers: [Answer]) -> Answer {
        var checkCounter = 0
        var mostAnimal: Answer!
        for answer in choosenAnswers {
            var counter = 0
            for answerIn in choosenAnswers {
                if answer.type == answerIn.type {
                    counter += 1
                }
            }
            if counter > checkCounter {
            checkCounter = counter
                mostAnimal = answer
            }
        }
        return mostAnimal
    }
    
    private func setResultVC(for animal: Answer) {
        resultAnimalEmoji.text = "Вы - \(animal.type.rawValue)"
        resultAnimalText.text = animal.type.definition
    }
    
}
