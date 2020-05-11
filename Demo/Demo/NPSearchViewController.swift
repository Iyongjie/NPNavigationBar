//
//  NPSearchViewController.swift
//  Demo
//
//  Created by 李永杰 on 2020/5/11.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit

class NPSearchViewController: NPBaseViewController, UISearchBarDelegate {

    var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {

        addNavigationBar()
        navigationBar?.style = .leftAndMiddle
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 0))
        searchBar.delegate = self
        self.navigationBar?.addHeaderView(view: searchBar)
        self.navigationBar?.lineColor = .red
        self.navigationBar?.hiddenLineView = true
        
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.frame = CGRect(x: 0, y: 0, width: 250, height: 0)
        navigationBar?.layoutSubviews()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        navigationBar?.layoutSubviews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
    
}
