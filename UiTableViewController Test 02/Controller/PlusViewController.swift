
import UIKit

enum Operation: String {
    case e = "="
    case a = "+"
    case s = "-"
    case D = "/"
    case M = "*"
    case N = "Nil"
}

class PlusViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var runningNumber = "0"
    var leftValue: Double = 0
    var rightValue: Double = 0
    var result: Double = 0
    var currentOperation: Operation = .N
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = runningNumber
    }
    
    func setOutputLabelSize(string: String) {
        let str = string
        if str.count == 7 {
            outputLabel.font = UIFont.systemFont(ofSize: 80)
        } else if str.count == 8 {
            outputLabel.font = UIFont.systemFont(ofSize: 70)
        } else if str.count == 9 {
            outputLabel.font = UIFont.systemFont(ofSize: 60)
        }
    }
    
    func operation(operation: Operation) {
        if currentOperation == .N {
            leftValue = Double(runningNumber)!
            runningNumber = "0"
            currentOperation = operation
        } else {
            if runningNumber != "0" {
                rightValue = Double(runningNumber)!
                runningNumber = "0"
                
                if currentOperation == .a {
                    result = leftValue + rightValue
                } else if currentOperation == .s {
                    result = leftValue - rightValue
                } else if currentOperation == .M {
                    result = leftValue * rightValue
                } else if currentOperation == .D {
                    result = leftValue / rightValue
                }
                
                let formatted = String(format:"%.2f", result)
                leftValue = Double(formatted)!
                
                setOutputLabelSize(string: formatted)
                outputLabel.text = formatted
            }
            currentOperation = operation
        }
    }
    
    @IBAction func numberClick(_ sender: UIButton) {
        
        if runningNumber.count <= 8 {
            if (sender.tag == 10) {
                if runningNumber.contains(".") == false {
                    runningNumber += "."
                }
            } else {
                if runningNumber == "0" {
                    runningNumber = String(sender.tag)
                } else {
                    runningNumber += String(sender.tag)
                }
            }
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func operatorClick(_ sender: UIButton) {
        if sender.tag == 11 {
            operation(operation: currentOperation)
        } else if sender.tag == 12 {
            operation(operation: .a)
        } else if sender.tag == 13 {
            operation(operation: .s)
        } else if sender.tag == 14 {
            operation(operation: .M)
        } else if sender.tag == 15 {
            operation(operation: .D)
        } else if sender.tag == 16 {
            runningNumber = "0"
            outputLabel.text = runningNumber
            leftValue = 0
            rightValue = 0
            result = 0
            currentOperation = .N
            outputLabel.font = UIFont.systemFont(ofSize: 90)
        }
    }
}
