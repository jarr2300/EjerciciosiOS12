//
//  QuestionFactory.swift
//  07-MathsTraining
//
//  Created by Macabuku on 9/1/19.
//  Copyright © 2019 Macabuku. All rights reserved.
//

import Foundation

class QuestionFactory {
    
    private var questions = [Question]()
    public private(set) var score = 0
    
    func getQuestionAt(position: Int) -> Question? {
        if(position<0||position>=questions.count){
            return nil
        }
        
        return self.questions[position]
        
    }
    
    func numberOfQuestions() -> Int {
        return questions.count
    }
    
    
}
