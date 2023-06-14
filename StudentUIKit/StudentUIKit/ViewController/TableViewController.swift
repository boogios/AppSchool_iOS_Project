import UIKit

//let students: [String] = [
//    "KeeN","SW","iOS", "PUJIN",
//    "KeeN","SW","iOS", "PUJIN",
//    "KeeN","SW","iOS", "PUJIN",
//    "KeeN","SW","iOS", "PUJIN",
//    "KeeN","SW","iOS", "PUJIN",
//    "KeeN","SW","iOS", "PUJIN",
//    "KeeN","SW","iOS", "PUJIN",
//    "KeeN","SW","iOS", "PUJIN",
//    "KeeN","SW","iOS", "PUJIN",
//    "KeeN","SW","iOS", "PUJIN",
//]

class TableViewController: UITableViewController {
    
    var message: String = "Select a student"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    // Section의 개수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Section마다 몇개의 row가 포함되어있는지
    // Section 숫자만큼 호출됨
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return students.count
        default:
            return 0
        }
    }
    
    // Section과 row 정보가 모아져 나온 indexPath 값에 맞춰 적절한 cell을 만들어 던저줌
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MyCell")
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "\(message)"
        case 1:
            let row = indexPath.row
            let name = students[row].name
            let number = students[row].number
            
            cell.textLabel?.text = "\(name)"
            cell.detailTextLabel?.text = "\(number)"
        default:
            break
        }
        
        return cell
    }
    
    // 특정 indexPath의 row를 선택했을 때의 액션들
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            break
        case 1:
            let row = indexPath.row
            let name = students[row].name
            let number = students[row].number
            
            message = "\(number) \(name)"
        default:
            break
        }
        
        tableView.reloadData()
    }
}
