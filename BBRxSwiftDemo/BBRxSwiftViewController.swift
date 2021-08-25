//
//  BBRxSwiftViewController.swift
//  BBRxSwiftDemo
//
//  Created by SJXC on 2021/8/25.
//

import UIKit
import RxSwift
import RxCocoa

struct DemoModel {
    var firstKey:String
    var secondKey:Int
    init(firstKey:String, secondKey:Int) {
        self.firstKey = firstKey
        self.secondKey = secondKey
    }
}

struct DemoViewModel {
//结构体中的数组被包装成了Observable
    let infoAry = Observable.just(
        [DemoModel(firstKey: "1-1", secondKey: 1),
        DemoModel(firstKey: "1-2", secondKey: 2),
        DemoModel(firstKey: "1-3", secondKey: 3),
        DemoModel(firstKey: "1-4", secondKey: 4)])
}

class BBRxSwiftViewController: UIViewController {
    
    lazy var firstTableView: UITableView = UITableView()
    let viewModel = DemoViewModel()
    let disposeBag = DisposeBag()
    
    static func show(superV: UIViewController) {
        let vc = BBRxSwiftViewController()
        superV.navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "RXSwiftUI"
        createTableView()
        bindViewModel()
    }

}

extension BBRxSwiftViewController{
    func createTableView() -> Void {
        view.addSubview(firstTableView)
        firstTableView.frame = view.bounds;
        firstTableView.backgroundColor = UIColor.orange
        firstTableView.delegate = self
        
        firstTableView.register(UINib(nibName: String(describing: JXRxRootCell.self), bundle: nil), forCellReuseIdentifier: String(describing: JXRxRootCell.self))
    }
    
    func bindViewModel() -> Void {
        //此方法将viewModel与tableView进行绑定

        viewModel.infoAry.bind(to: firstTableView.rx.items(cellIdentifier:String(describing: JXRxRootCell.self))){
            row,model,cell in
            //cell的具体显示内容可在此处自定义
            if let ce = cell as? JXRxRootCell {
                ce.loadData(model: model)
            }
        }.disposed(by: disposeBag)
        
        //点击cell的响应事件
        firstTableView.rx.modelSelected(DemoModel.self).subscribe(onNext: { (model) in
            print("select \(model.firstKey)")
        }).disposed(by: disposeBag)
    }
}

extension BBRxSwiftViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}




