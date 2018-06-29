
import UIKit

class AlarmViewController: UIViewController {
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var timer: UISwitch!
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.setOn(false, animated: true)
    }
    @objc func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss a"
        time.text = formatter.string(from: date)
    }
    
    @IBAction func timerstart(_ sender: Any) {
        if timer.isOn == true {
            myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block:{(myTimer) in self.updateTime()
            })
            
        } else {
            myTimer.invalidate()
        }
    }
}
