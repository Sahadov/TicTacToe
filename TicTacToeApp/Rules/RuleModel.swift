import Foundation

struct Rule {
    let number: String
    let text: String
}

struct RuleModel {
    static let rules: [Rule] = [
        Rule(number: "1", text: "Draw a grid with three rows and \nthree columns, creating nine \nsquares in total."),
        Rule(number: "2", text: "Players take turns placing their \nmarker (X or O) in an empty \nsquare. \nTo make a move, a player \nselects a number \ncorresponding to the square \nwhere they want to place their \nmarker."),
        Rule(number: "3", text: "Player X starts by choosing a \nsquare (e.g., square 5). \nPlayer O follows by choosing \nan empty square (e.g., square \n1). \nContinue alternating turns until \nthe game ends."),
        Rule(number: "4", text: "The first player to align three \nof their markers horizontally, \nvertically, or diagonally wins. \nExamples of Winning \nCombinations: \nHorizontal: Squares 1, 2, 3 \nor 4, 5, 6 or 7, 8, 9 \nVertical: Squares 1, 4, 7 or 2, 5, \n8 or 3, 6, 9 \nDiagonal: Squares 1, 5, 9 or \n3, 5, 7")
    ]
}
