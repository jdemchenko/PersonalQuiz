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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        resultAnimal = determiningTheMostCommonAnimal()
        setResultVC(for: resultAnimal.type)
    }
}

extension ResultsViewController {
    private func determiningTheMostCommonAnimal() -> Answer {
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
    
    private func setResultVC(for animal: AnimalType) {
        resultAnimalEmoji.text = "Вы - \(animal.rawValue)"
        resultAnimalText.text = animal.definition
    }
    
}
