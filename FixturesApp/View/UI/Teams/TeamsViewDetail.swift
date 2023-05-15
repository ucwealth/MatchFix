//  Created on 14/05/2023

import UIKit

class TeamsViewDetailViewController: UIViewController, TeamsViewModelDelegate {
    let teamsDetailView = TeamsViewDetail()
    let viewModel = TeamsViewModel()

    func didUpdateSquadData() {
        DispatchQueue.main.async {[weak self] in
            self?.teamsDetailView.tableView.reloadData()
            self?.teamsDetailView.squadList = self?.viewModel.teamSquad
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(teamsDetailView)
//        view.backgroundColor = .gray
        viewModel.delegate = self

    }
}

class TeamsViewDetail: BaseView {

    var tableView = UITableView()
    var dataSource: TableViewDataSource<Squad>?

    var squadList: [Squad]? {
        didSet {
            dataSource?.items = squadList ?? []
            tableView.reloadData()
        }
    }
    
    let teamCrestImage = Utility.createImage(
        imagename: "snowflake.circle",
        imageWidth: 250, imageHeight: 150)
    
    override func setupView() {
        addSubview(teamCrestImage, anchors: [.top(5), .centerX(0), .trailing(0), .leading(0) ])
        addSubview(tableView,
                   anchors: [.leading(10), .trailing(-10), .top(30), .centerX(0) ])
        tableView.register(TeamsViewDetailCell.self,
                           forCellReuseIdentifier: MessagesConstant.teamsDetailCellID)
        
        dataSource = TableViewDataSource(items: [],
                                         identifier: MessagesConstant.teamsDetailCellID,
                                         cellConfigurator: { squad, cell in
            if let squadCell = cell as? TeamsViewDetailCell {
                squadCell.configure(with: squad)
            }
        })
        tableView.rowHeight = 44
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.backgroundColor = .orange
        
    }
    
}

class TeamsViewDetailCell: BaseTableCell {
    
    let num = Utility.createLabel()
    let playerName = Utility.createLabel(text: "David de Gea")
    let playerPosition = Utility.createLabel(text: "Keeper")
    lazy var container = Utility.createStack(views: [num, playerName, playerPosition])
    
    override func setupViews() {
        contentView.addSubview(container, anchors: [.leading(0), .trailing(-10), .centerY(0)])
    }
    
    func configure(with model: Squad) {
        playerName.text = model.firstName + (model.lastName ?? "")
        playerPosition.text = model.position.rawValue
    }
    
}
