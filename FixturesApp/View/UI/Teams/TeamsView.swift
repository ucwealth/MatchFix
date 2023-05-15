//  Created on 14/05/2023

import UIKit

protocol TeamsViewDelegate: AnyObject {
    func didSelectGridItem(_ team: Team)
}

class TeamsView: BaseView,
                 UICollectionViewDataSource,
                 UICollectionViewDelegate {
    
    weak var delegate: TeamsViewDelegate?
    var teamList = [Team]()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 130)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
       let cview = UICollectionView(
        frame: .zero,
        collectionViewLayout: layout)
        return cview
        
    }()
    
    override func setupView() {
        addSubview(collectionView,
                   anchors: [.leading(0), .trailing(0), .bottom(0), .top(0)])
        
        collectionView.register(
            TeamsViewCell.self,
            forCellWithReuseIdentifier: MessagesConstant.teamsCellID)
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return teamList.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MessagesConstant.teamsCellID,
            for: indexPath) as? TeamsViewCell else {
            return UICollectionViewCell()
        }
        // setup
        let team = teamList[indexPath.row]
        cell.configure(with: team)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        // fetch squad from teams here
        let selectedTeam = teamList[indexPath.row]
        delegate?.didSelectGridItem(selectedTeam)

    }
    
}
