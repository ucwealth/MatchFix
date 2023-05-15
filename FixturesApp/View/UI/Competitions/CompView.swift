//  Created on 10/05/2023

import UIKit

protocol CompetitionsViewDelegate: AnyObject {
    func didSelectRowItem(_ competition: Competition)
}
class CompetitionsView: BaseView {
    var tableView = UITableView()
    var dataSource: TableViewDataSource<Competition>?
    weak var delegate: CompetitionsViewDelegate?
    var comp: [Competition]? {
        didSet {
            dataSource?.items = comp ?? []
            tableView.reloadData()
        }
    }
    
    override func setupView() {
        addSubview(tableView,
                   anchors: [.leading(0), .trailing(0), .bottom(0), .top(0)])
        tableView.register(CompetitionsListCell.self,
                           forCellReuseIdentifier: MessagesConstant.compViewCellID)
        
        dataSource = TableViewDataSource(items: [],
                                         identifier: MessagesConstant.compViewCellID,
                                         cellConfigurator: { competition, cell in
            if let compCell = cell as? CompetitionsListCell {
                compCell.accessoryType = .disclosureIndicator
                compCell.configure(with: competition)
            }
        }, didSelectRow: { [weak self] competition in
            let selectedID = competition.id
            UserDefaults.standard.set(selectedID, forKey: "competitionID")
            self?.delegate?.didSelectRowItem(competition)
            
        })
        tableView.rowHeight = 44
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
    }
}
