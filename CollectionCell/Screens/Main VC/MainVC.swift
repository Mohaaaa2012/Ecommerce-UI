//
//  TableVC.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 07/12/2020.
//

import UIKit

//MARK: - PushViewControllers Protocol
protocol pushControllers {
    func pushFromCategorySection(index: IndexPath)
    func pushFromFashionSection(index: IndexPath)
    func pushFromHomeSection(index: IndexPath)
}


//MARK: - TableView Class
class MainVC: UITableViewController {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIView()
        setupTableView()
    }
    
    
    func setupTableView() {
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.registerCellClass(cellClass: HeaderCell.self)
        tableView.registerCellClass(cellClass: FooterCell.self)
        tableView.registerCellClass(cellClass: TallTableCell.self)
        tableView.registerCellClass(cellClass: SmallRectTableCell.self)
        tableView.registerCellClass(cellClass: CategoryTableCell.self)
        tableView.registerCellClass(cellClass: FashionTableCell.self)
        tableView.registerCellClass(cellClass: HomeTableCell.self)
        tableView.registerCellClass(cellClass: AdsTableCell.self)
    }
    
    
    func setupUIView() {
        view.backgroundColor = UIColor(named: "headerColor")
        navigationController?.navigationBar.barTintColor = UIColor(named: "tabBarColor")
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Home"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25)]
    }
        
    
    
    // MARK: - Table view data source Extension

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        switch section {
        case 0,1:
            return 2
        default:
            return 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            // Ads first row
            if indexPath.row == 0 {
                // Small rectangular
                let cell = tableView.dequeueReusableCell(withIdentifier: AdsTableCell.cellId, for: indexPath) as! AdsTableCell
                cell.configure(cellsNumber: 5, cellHeight: screenHeight * 0.12, cellWidth: (screenWidth - 5) / 2.5)
                return cell
            }
            // timer row
            else {
                // slider with timer
                let cell = tableView.dequeueReusableCell(withIdentifier: SmallRectTableCell.cellId, for: indexPath) as! SmallRectTableCell
                cell.configure(cellsNumber: 10, cellHeight: screenHeight * 0.2, cellWidth: screenWidth)
                cell.startTimer()
                return cell
            }
            
        case 1:
            // ads row
            if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: SmallRectTableCell.cellId, for: indexPath) as! SmallRectTableCell
                cell.configure(cellsNumber: 4, cellHeight: screenHeight * 0.12, cellWidth: (screenWidth - 5) / 2.5)
                return cell
            }
            // Caregory row
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableCell.cellId, for: indexPath) as! CategoryTableCell
                cell.categorySectionDelegate = self
                cell.configure(cellsNumber: 7, cellHeight: screenHeight * 0.25, cellWidth: screenWidth)
                return cell
            }
        // Fashion row
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: FashionTableCell.cellId, for: indexPath) as! FashionTableCell
            cell.configure(cellsNumber: 9, cellHeight: screenHeight * 0.25, cellWidth: screenWidth)
            cell.fashionSectionDelegate = self
            return cell
        // Home row
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableCell.cellId, for: indexPath) as! HomeTableCell
            cell.HomeSectionDelegate = self
            cell.configure(cellsNumber: 5, cellHeight: screenHeight * 0.25, cellWidth: screenWidth)
            return cell
        // Tall rows
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TallTableCell.tallCellId, for: indexPath) as! TallTableCell
            return cell
        }
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: HeaderCell.headerId) as! HeaderCell
        switch section {
        case 1:
            header.label = "Browse By category"
            header.headerButton.addTarget(self, action: #selector(categoryHandling), for: .touchUpInside)
        case 2:
            header.label = "Fashon Store"
            header.headerButton.addTarget(self, action: #selector(fashionHandling), for: .touchUpInside)
        case 3:
            header.label = "Home Store"
            header.headerButton.addTarget(self, action: #selector(homeHandling), for: .touchUpInside)
        case 4:
            header.label = "Mobile Phones For You"  // depends
            header.headerButton.isHidden = true
        case 5:
            header.label = "Recently viewed Items"
            header.headerButton.isHidden = true
        case 6:
            header.label = "Tablest for You" // depends
            header.headerButton.isHidden = true
        default:
            header.label = ""
        }
        return header
    }
    
    @objc func categoryHandling() {
        let allCategories = AllCategoriesVC()
        navigationController?.pushViewController(allCategories, animated: true)
    }
    
    @objc func fashionHandling() {
        let souqFashionVC = SouqFashionVC()
        navigationController?.pushViewController(souqFashionVC, animated: true)
    }
    
    @objc func homeHandling() {
        let kitchenVC = KitchenVC()
        navigationController?.pushViewController(kitchenVC, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(40)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            if (indexPath.row == 0) {
                return CGFloat(screenHeight * 0.13)
            }
            return CGFloat(screenHeight * 0.21)
        case 1:
            if (indexPath.row == 1) {
                return CGFloat(screenHeight * 0.13)
            }
            return CGFloat(screenHeight * 0.26)
        case 2,3:
            return CGFloat(screenHeight * 0.26)
        default:
            return CGFloat(screenHeight * 0.4)
        }
    }
  
}


//MARK: - Protocol Extension

extension MainVC: pushControllers {
    
    func pushFromCategorySection(index: IndexPath) {
        switch index.row {
        case 0:
            let perfumesVC = PerfumesVC()
            navigationController?.pushViewController(perfumesVC, animated: true)
        case 1:
            let makeUpVC = MakeUpVC()
            navigationController?.pushViewController(makeUpVC, animated: true)
        case 2:
            let electronicsVC = ElectronicsVC()
            navigationController?.pushViewController(electronicsVC, animated: true)
        case 3:
            let personalCareVC = PersonalCareVC()
            navigationController?.pushViewController(personalCareVC, animated: true)
        case 4:
            let mobilesVC = MobilesVC()
            navigationController?.pushViewController(mobilesVC, animated: true)
        case 5:
            let tvsVC = TVsVC()
            navigationController?.pushViewController(tvsVC, animated: true)
        default:
            let sportsVC = SportsVC()
            navigationController?.pushViewController(sportsVC, animated: true)
        }
    }
    
    
    func pushFromFashionSection(index: IndexPath) {
        switch index.row {
        case 0:
            let below199EGP = Below199EGPVC()
            navigationController?.pushViewController(below199EGP, animated: true)
        case 1:
            let menVC = MenApparelVC()
            navigationController?.pushViewController(menVC, animated: true)
        case 2:
            let shoesVC = ShoesVC()
            navigationController?.pushViewController(shoesVC, animated: true)
        case 3:
            let bagsWalletsVC = BagsWalletsVC()
            navigationController?.pushViewController(bagsWalletsVC, animated: true)
        case 4:
            let eyeWearVC = EyeWearVC()
            navigationController?.pushViewController(eyeWearVC, animated: true)
        case 5:
            let womenVC = WomenApparelVC()
            navigationController?.pushViewController(womenVC, animated: true)
        case 6:
            let watchesVC = WatchesVC()
            navigationController?.pushViewController(watchesVC, animated: true)
        case 7:
            let kidsVC = KidsFashionVC()
            navigationController?.pushViewController(kidsVC, animated: true)
        default:
            let jewelryVC = JewelryVC()
            navigationController?.pushViewController(jewelryVC, animated: true)
        }
    }
    
    
    func pushFromHomeSection(index: IndexPath) {
        switch index.row {
        case 0:
            let kitchenDealsVC = KitchenDealsVC()
            navigationController?.pushViewController(kitchenDealsVC, animated: true)
        case 1:
            let entertainmentVC = HomeEntertainmentVC()
            navigationController?.pushViewController(entertainmentVC, animated: true)
        case 2:
            let homeEssentialsVC = HomeEssentialsVC()
            navigationController?.pushViewController(homeEssentialsVC, animated: true)
        case 3:
            let toysVC = ToysVC()
            navigationController?.pushViewController(toysVC, animated: true)
        default:
            let homeImprovementsVC = HomeImprovementsVC()
            navigationController?.pushViewController(homeImprovementsVC, animated: true)
        }
    }
}
