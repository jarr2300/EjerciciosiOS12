//
//  QuestionsFactory.swift
//  05-QuizzApp
//
//  Created by Macabuku on 31/12/18.
//  Copyright © 2018 Macabuku. All rights reserved.
//

import Foundation

class QuestionsFactory{
    
    var questions = [Question]()
    
    init() {
        
        
        
    }
    
    func getQuestionAt(index: Int) -> Question? {
        if index<0 || index>questions.count {
            return nil
        }else {
            return questions[index]
        }
    }
    
    func generateRandomQuestion() -> Question {
        let index = Int.random(in: 0..<questions.count)  // genera un número aleatorio
        return questions[index]
    }
    
    
}
