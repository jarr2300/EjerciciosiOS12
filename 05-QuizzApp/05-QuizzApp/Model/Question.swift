//
//  Question.swift
//  05-QuizzApp
//
//  Created by Macabuku on 31/12/18.
//  Copyright © 2018 Macabuku. All rights reserved.
//

import Foundation

class Question : CustomStringConvertible {

    
    let questionText : String
    let answer: Bool
    
    var description : String {
        let respuesta = (answer ? "Verdadera" : "Falsa")
        return """
        Pregunta:
        ---------
        - \(questionText)
        - Respuesta : \(respuesta)
"""
    }

    
    init(text: String, correctAnswer: Bool) {
        self.questionText = text
        self.answer = correctAnswer
    }   
    
}



/* Ejemplo de cómo se podrían construir las preguntas
class MySecondClass {
    let question1 = Question(text: "El sentido de la vida es 42", correctAnswer: true)
    let question2 = Question(text: "La tierra es plana", correctAnswer: false)
}
*/
