//
//  NEAlbumListViewController.swift
//  CodingExercise
//
//  Created by Arun Thakkar on 12/3/18.
//  Copyright © 2018 Arun Thakkar. All rights reserved.
//

import UIKit

class CEAlbumListViewController: UITableViewController {
    var loadingView    : LoadingView!
    var albums         : [Album]!
    override var prefersStatusBarHidden: Bool {
        return false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.addLoadingView()
        self.loadAlbumData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor.blue
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.title = ALBUM_TITLE
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: - Table view UI Setup
    func setupTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier:ALBUM_CELL_IDENTIFIER)
    }
    // MARK: - Adding Loading View with Constraint
    private func addLoadingView() {
        loadingView = LoadingView(frame: self.view.frame)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loadingView)
        self.setUpLoadingView()
    }
    func setUpLoadingView() {
        let horConstraint = NSLayoutConstraint(item: loadingView!, attribute: .centerX, relatedBy: .equal,
                                               toItem: self.tableView, attribute: .centerX,
                                               multiplier: 1.0, constant: 0.0)
        let verConstraint = NSLayoutConstraint(item: loadingView!, attribute: .centerY, relatedBy: .equal,
                                               toItem: self.view, attribute: .centerY,
                                               multiplier: 0.8, constant: 0.0)
        let widConstraint = NSLayoutConstraint(item: loadingView!, attribute: .width, relatedBy: .equal,
                                               toItem: self.view, attribute: .width,
                                               multiplier: 0.1, constant: 0.0)
        let heiConstraint = NSLayoutConstraint(item: loadingView!, attribute: .height, relatedBy: .equal,
                                               toItem: self.tableView, attribute: .height,
                                               multiplier: 0.1, constant: 0.0)
        
        view.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
        
    }
    // MARK: - Load Data By Calling API
    private func loadAlbumData(){
        do {
            try CEAPIManager.getDataUsingRequest(urlString: RSS_URL, completion: { (response) in
                self.loadingView.hideLoadingView()
                if response?.count ?? ZERO_COUNT > ZERO_COUNT {
                    self.albums = response
                    self.tableView.reloadData()
                }
            })
        }catch {
        }
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return SECTION_COUNT
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if self.albums != nil && self.albums.count > ZERO_COUNT {
            return albums.count
        } else {
            return ZERO_COUNT
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:SubtitleTableViewCell? = self.tableView.dequeueReusableCell(withIdentifier: ALBUM_CELL_IDENTIFIER, for: indexPath) as? SubtitleTableViewCell
        if cell == nil {
            cell = SubtitleTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: ALBUM_CELL_IDENTIFIER)
        }
        cell?.setData(album: albums[indexPath.row])
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = CEAlbumDetailViewController()
        detailVC.view.backgroundColor = UIColor.white
        detailVC.selectedAlbum = albums[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(ROW_HEIGHT)
    }

}
