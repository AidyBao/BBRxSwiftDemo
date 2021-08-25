//
//  BBNormalUIViewController.swift
//  BBRxSwiftDemo
//
//  Created by SJXC on 2021/8/25.
//

import UIKit

struct DataSource {
//结构体中的数组被包装成了Observable
    let list =
        [DemoModel(firstKey: "1-1", secondKey: 1),
        DemoModel(firstKey: "1-2", secondKey: 2),
        DemoModel(firstKey: "1-3", secondKey: 3),
        DemoModel(firstKey: "1-4", secondKey: 4)]
}

class BBNormalUIViewController: UIViewController {

    lazy var firstTableView: UITableView = UITableView()
    let viewModel = DemoViewModel()
    let datasource = DataSource()
    
    static func show(superV: UIViewController) {
        let vc = BBNormalUIViewController()
        superV.navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NormalUI"
        createTableView()

    }
    
}

extension BBNormalUIViewController{
    func createTableView() -> Void {
        view.addSubview(firstTableView)
        firstTableView.frame = view.bounds;
        firstTableView.backgroundColor = UIColor.orange
        firstTableView.delegate = self
        firstTableView.dataSource = self
        
        firstTableView.register(UINib(nibName: String(describing: JXRxRootCell.self), bundle: nil), forCellReuseIdentifier: String(describing: JXRxRootCell.self))
    }

}

extension BBNormalUIViewController: UITableViewDelegate{
    
}

extension BBNormalUIViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: JXRxRootCell = tableView.dequeueReusableCell(withIdentifier: String(describing: JXRxRootCell.self), for: indexPath) as! JXRxRootCell
        cell.loadData(model: datasource.list[indexPath.row])
        return cell
    }
}



