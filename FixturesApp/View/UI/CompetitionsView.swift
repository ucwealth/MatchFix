//  Created on 10/05/2023

import UIKit
import SwiftUI

class CompetitionsView: BaseView {
    
    var tableView = UITableView()
    var dataSource: TableViewDataSource<CompetitionsViewModel>?
    var viewModelArr = [
        CompetitionsViewModel(competition: Competition(id: 1, name: "Love")),
        CompetitionsViewModel(competition: Competition(id: 2, name: "Peace")),
        CompetitionsViewModel(competition: Competition(id: 1, name: "Joy"))
    ]
    
    override func setupView() {
        addSubview(tableView, anchors: [.leading(0), .trailing(0), .bottom(0), .top(0)])
        tableView.register(CompetitionsListCell.self,
                           forCellReuseIdentifier: MessagesConstant.compViewCellID)

        dataSource = TableViewDataSource(items: viewModelArr,
                                         identifier: MessagesConstant.compViewCellID,
                                         cellConfigurator: { viewModel, cell in
            if let competitionCell = cell as? CompetitionsListCell {
                competitionCell.configure(with: viewModel)
            }
        }, didSelectRow: { viewModel in
            // Push next VC onto the nav stack
            
            print("Selected: \(viewModel.title)")
        })
        
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.rowHeight = 44
        
    }
    
}

class CompetitionsListCell: UITableViewCell {

    // MARK: - Properties

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .darkText
        return label
    }()
    
    let disclosureIndicator: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .lightGray
        return imageView
    }()
        
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel, anchors: [.leading(10), .centerY(0)])
        contentView.addSubview(disclosureIndicator, anchors: [.trailing(-15), .centerY(0)])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public API
    
    func configure(with viewModel: CompetitionsViewModel) {
        titleLabel.text = viewModel.title
    }
    
}

//#if DEBUG
//struct CompetitionsViewContainer: UIViewRepresentable {
//    typealias UIViewType = CompetitionsView
//
//    func makeUIView(context: Context) -> UIViewType {
//        return CompetitionsView(frame: .zero)
//    }
//
//    func updateUIView(_ uiView: CompetitionsView, context: Context) {}
//}
//
//struct CompetitionsViewContainer_Previews: PreviewProvider {
//    static var previews: some View {
//        CompetitionsViewContainer().preferredColorScheme(.light)
////        Group {
////            BackgroundViewContainer().colorScheme(.light)
////            BackgroundViewContainer().colorScheme(.dark)
////        }.previewLayout(.fixed(width: 200, height: 200))
//    }
//}
//#endif
