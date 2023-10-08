//
//  CustomTableViewController.swift
//  CustomUITableViewExample
//
//  Created by Minyoung Yoo on 10/8/23.
//

import UIKit

class CustomTableViewController: UIViewController {

    //MARK: Data
    let tableData: [TableDataModel] = [
        TableDataModel(id: 1, image: UIImage(named:"1")!, title: "pepe1"),
        TableDataModel(id: 2, image: UIImage(named:"2")!, title: "pepe2"),
        TableDataModel(id: 3, image: UIImage(named:"3")!, title: "pepe3"),
        TableDataModel(id: 4, image: UIImage(named:"4")!, title: "pepe4"),
        TableDataModel(id: 5, image: UIImage(named:"5")!, title: "pepe5"),
    ]
    
    //MARK: UI Component
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = true
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        setupViews()
    }

    //MARK: Setup Views
    func setupViews() {
        self.view.backgroundColor = .systemBackground
        
        let childViews = [tableView]
        self.view.addSubviews(childViews: childViews)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
    }
}

//MARK: Delegate
extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("failed to dequeue.")
        }
        
        let data = tableData[indexPath.row]
        cell.configureView(image: data.image, label: data.title)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = tableData[indexPath.row]
        print("You've selected \(data.title)")
    }
    
}

extension UIView {
    func addSubviews(childViews: [UIView]) {
        childViews.forEach { view in
            self.addSubview(view)
        }
    }
}

#Preview {
    CustomTableViewController()
}
