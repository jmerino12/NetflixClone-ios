//
//  NewAndPopularViewController.swift
//  NetflixClone
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 6/10/22.
//

import UIKit

class NewAndPopularViewController: UIViewController {


    let scrollView: UIScrollView = {
        let myScrollView = UIScrollView()
        myScrollView.translatesAutoresizingMaskIntoConstraints = false
        myScrollView.backgroundColor = .white
        return myScrollView
    }()
    
    var scrollContainer : UIStackView = {
        let mystack = UIStackView()
        mystack.translatesAutoresizingMaskIntoConstraints = false
        mystack.spacing = 20
        mystack.axis = .vertical
        mystack.backgroundColor = .blue
        return mystack
    }()
    let imageHeader : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 1.5).isActive = true
        view.backgroundColor = .cyan
        return view
    }()
    
    let myTable : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false
        table.rowHeight = UITableView.automaticDimension
        return table
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        setupScrollView()
        setContraintsScrollView()
        setupScrollViewContainer()
        setContrainstsScrollViewContainer()
        
        setupTableView()
        
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
    }
    func setContraintsScrollView() {
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    }
    
    func setupScrollViewContainer() {
        scrollView.addSubview(scrollContainer)
        scrollContainer.addArrangedSubview(imageHeader)
        scrollContainer.addArrangedSubview(myTable)

    }
    
    func setContrainstsScrollViewContainer(){
        scrollContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        scrollContainer.backgroundColor = .lightGray
        
    }
    
    func setupTableView() {
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTable.dataSource = self
    }
    

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(myTable.contentSize.height)
        myTable.heightAnchor.constraint(equalToConstant:myTable.contentSize.height).isActive = true
        
    }
    

}

extension NewAndPopularViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
}
