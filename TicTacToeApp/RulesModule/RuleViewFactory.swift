import Foundation

class RuleViewFactory {
    func createRuleViews(from rules: [Rule]) -> [RuleView] {
        return rules.map { rule in
            let ruleView = RuleView()
            ruleView.translatesAutoresizingMaskIntoConstraints = false
            ruleView.setValues(rule.number, rule.text)
            return ruleView
        }
    }
    
    func height(for index: Int) -> CGFloat {
        switch index {
        case 1:
            return 190
        case 2:
            return 170
        case 3:
            return 255
        default:
            return 90
        }
    }
}
