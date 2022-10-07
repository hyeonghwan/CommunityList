//
//  ViewController.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
import RxDataSources

class ViewController: UIViewController {

    private var viewModel: RxViewModelType
    
    private var disposeBag = DisposeBag()
    
    private lazy var headerView: TableViewSectionHeader = {
        let view = TableViewSectionHeader()
        return view
    }()
    
    lazy var containerTableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .grouped)
        tableview.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identify)
        tableview.register(HorizonTalTableSectionCell.self, forCellReuseIdentifier: HorizonTalTableSectionCell.identify)
        tableview.backgroundColor = .systemCyan

       return tableview
    }()
    
    enum TableViewSectionType: Int{
        case collection = 0
        case table = 1
    }
    
    var tableDataSource = RxTableViewSectionedReloadDataSource<CommunitySection>(configureCell: {
        dataSource, tableView, indexPath, item in
        print("item \(item)")
        let section = TableViewSectionType(rawValue: indexPath.section)
        print("section \(section)")
        switch section{
        case .collection:
            guard let collectionViewcell = tableView.dequeueReusableCell(withIdentifier: HorizonTalTableSectionCell.identify, for: indexPath) as? HorizonTalTableSectionCell else { return UITableViewCell() }
            
            
            return collectionViewcell
            
        case .table:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identify, for: indexPath)
                    as? TableViewCell else {return UITableViewCell()}
          
            cell.onData.onNext(item)
            return cell
        default:
            assert(false,"error")
        }
        
        
        // item == [rxDataModel]
    })
    
    init(_ viewModel: RxViewModelType = RxViewModel() ){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        super.loadView()
       
     
        settingNavigation()
        configureAddContentLayout()
        configureEndEditing()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchListDataModel.onNext(())
        
        self.containerTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        setUpBinding()
        
   }
    
    func setUpBinding() {
        viewModel.allContents
            .bind(to: containerTableView.rx.items(dataSource: tableDataSource))
            .disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDelegate{
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        switch section{
        case 0:
            let framez = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 170)
            return TableViewSectionHeader(frame: framez)
        default:
            return nil
        }
    }
}


