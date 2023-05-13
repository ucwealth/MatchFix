//  Created on 10/05/2023

import UIKit

class TodayView: UIView {



}

class TodayListCell: BaseTableCell {

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
        
    // MARK: - Setup Views
    
    override func setupViews() {
        contentView.addSubview(titleLabel, anchors: [.leading(10), .centerY(0)])
        contentView.addSubview(disclosureIndicator, anchors: [.trailing(-15), .centerY(0)])
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
