//  Created on 12/05/2023

import UIKit

class TableViewDataSource<T>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    typealias CellConfigurator = (T, UITableViewCell) -> Void
    typealias DidSelectRow = (T) -> Void
    
    var items: [T]
    var cellConfigurator: CellConfigurator?
    var didSelectRow: DidSelectRow?
    var identifier: String
    
    init(items: [T], identifier: String, cellConfigurator: CellConfigurator? = nil, didSelectRow: DidSelectRow? = nil) {
        self.items = items
        self.identifier = identifier
        self.cellConfigurator = cellConfigurator
        self.didSelectRow = didSelectRow
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let item = items[indexPath.row]
        cellConfigurator?(item, cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = items[indexPath.row]
        didSelectRow?(selectedItem)
    }
    
}
