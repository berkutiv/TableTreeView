//
//  ViewController.swift
//  ContactsLBTA
//
//  Created by Brian Voong on 11/13/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let cellId = "cell"
    
    var dataSource = [GoodsCategory]()
    let cellNib = UINib(nibName: "CategoryTableViewCell", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = GoodsFabric.configureDataSource()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellNib, forCellReuseIdentifier: cellId)
        tableView.reloadData()
    }
    
    func handleExpandClose(indexPath: IndexPath) {
        var indexPaths = [IndexPath]()
        var indexPathsToCollapse = [IndexPath]()
        let model = dataSource[indexPath.row]
        var modelIndexPathRow = indexPath.row
        let isExpanded = model.isExpanded
        
        //удаляем все сабкатегории и добавляем их индексы
        for row in dataSource.indices {
            let object = dataSource[row]
            dataSource[row].isExpanded = false
            if object.level > model.level && object != model {
                let indexPath = IndexPath(row: row, section: 0)
                indexPathsToCollapse.append(indexPath)
            }
        }
        dataSource[modelIndexPathRow].isExpanded = !isExpanded
        dataSource = dataSource.filter({ (goodsCategory) -> Bool in
            goodsCategory.level <= model.level
        })
        
        //обновляем индекс нажатой модели после фильтрации массива
        modelIndexPathRow = dataSource.firstIndex(of: model) ?? dataSource.endIndex
        
        //добавляем модели сабкатегорий и их индексы
        for row in model.childrenCategories.indices {
            if dataSource[modelIndexPathRow].isExpanded {
                let modelToInsert = model.childrenCategories[row]
                dataSource.insert(modelToInsert, at: modelIndexPathRow + row + 1)
            }
            let indexPath = IndexPath(row: modelIndexPathRow + row + 1, section: 0)
            indexPaths.append(indexPath)
        }
        
        //релоад таблицы
        tableView.beginUpdates()
        tableView.deleteRows(at: indexPathsToCollapse, with: .fade)
        isExpanded ? () : tableView.insertRows(at: indexPaths, with: .fade)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CategoryTableViewCell
        let model = dataSource[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleExpandClose(indexPath: indexPath)
    }
}
