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

    
    lazy var containerTableView: UITableView = {
        
        let tableview = UITableView(frame: .zero, style: .grouped)
        
        tableview.allowsSelection = false
        
        tableview.backgroundColor = .tertiarySystemBackground
        
        tableview.separatorStyle = .none
        
        tableview.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identify)
        
        tableview.register(HorizonSectionCell.self, forCellReuseIdentifier: HorizonSectionCell.identify)

       return tableview
    }()
    
    
    private lazy var sectionHeader: TableViewHeader = {
    
        let view = TableViewHeader(frame: .zero)
        
        return view
    }()
    
    private lazy var footerView: NoneDataFooterView = {
        let view = NoneDataFooterView()
        
        return view
    }()
    
    enum TableViewSectionType: Int{
        case collection = 0
        case table = 1
        case none = 2
    }
    
    var tableDataSource = RxTableViewSectionedReloadDataSource<RxDataSection>(configureCell: {
        dataSource, tableView, indexPath, item in
        
        let section = TableViewSectionType(rawValue: indexPath.section)
        
        switch section{
            
        case .collection:
            guard let collectionViewcell = tableView.dequeueReusableCell(withIdentifier: HorizonSectionCell.identify, for: indexPath) as? HorizonSectionCell else { return UITableViewCell() }
            
            collectionViewcell.onData.onNext(item)
            
            return collectionViewcell
            
        case .table:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identify, for: indexPath)
                    as? TableViewCell else {return UITableViewCell()}
            
            cell.onData.onNext(item)
            
            return cell
        default:
            assert(false,"error")
        }
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

        viewModel.fetchRecommendCollectionData.onNext((.all))
        viewModel.fetchTableData.onNext((.all))
        
        self.containerTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        setUpBinding()
        
   }
    
 
    func setUpBinding() {

        let collection = BehaviorSubject<[RxDataSection]>(value: [])
        let table = BehaviorSubject<[RxDataSection]>(value: [])
        
        viewModel.recommendCollectionViewContents
            .subscribe(onNext: collection.onNext(_:))
            .disposed(by: disposeBag)
        
        viewModel.tableViewContents
            .subscribe(onNext: table.onNext(_:))
            .disposed(by: disposeBag)
        
        Observable.combineLatest(collection, table, resultSelector: { collection, table in
            collection + table
        }).bind(to: self.containerTableView.rx.items(dataSource: tableDataSource))
            .disposed(by: disposeBag)
        
        sectionHeader
            .categorySegemts
            .getObservableRequestType()
            .subscribe(onNext: viewModel.fetchRecommendCollectionData.onNext(_:))
            .disposed(by: disposeBag)
        
        sectionHeader
            .categorySegemts
            .getObservableRequestType()
            .subscribe(onNext: viewModel.fetchTableData.onNext(_:))
            .disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return UITableView.automaticDimension
        case 1:
            return CGFloat(250)
        default:
            return .leastNormalMagnitude
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        switch section{
        case 0:
            return sectionHeader
        default:
            return nil
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section{
        case TableViewSectionType.collection.rawValue:
            return CGFloat(187.7)
        default:
            return CGFloat(0)
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section{
        case TableViewSectionType.table.rawValue:
            return footerView
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case TableViewSectionType.table.rawValue:
            return CGFloat(50)
        default:
            return CGFloat(0)
        }
    }
}




