//  Created on 10/05/2023

import UIKit
import SwiftUI

class CompetitionsView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    var tableView = UITableView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure() {
        addSubview(tableView, anchors: [.leading(0), .trailing(0), .bottom(0), .top(0)])
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.backgroundColor = .red
        tableView.register(CompetitionsListCell.self, forCellReuseIdentifier: MessagesConstant.compViewCellID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessagesConstant.compViewCellID, for: indexPath) as? CompetitionsListCell else {
            return UITableViewCell()
        }
        return cell
    }

}

class CompetitionsListCell: UITableViewCell {
    
}
//
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
