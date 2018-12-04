//
//  NEAlbumDetailViewController.swift
//  CodingExercise
//
//  Created by Arun Thakkar on 12/4/18.
//  Copyright © 2018 Arun Thakkar. All rights reserved.
//

import UIKit

class CEAlbumDetailViewController: UIViewController {

    var selectedAlbum : Album!
    
    var imgArtWork   : LargeImageView!
    var lblAlbumName : CustomLabels!
    var lblArtist    : CustomLabels!
    var lblCopyRight : CustomLabels!
    var sepratorView : SepratorView!
    var loadingView  : LoadingView!
    var lblDate      : CustomLabels!
    var lblGenre     : CustomLabels!
    var lblGenreValue: CustomLabels!
    var sepViewGenre : SepratorView!
    var btnItune     : CustomButtons!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addLoadingView()
        self.addImageView()
        self.addAlbumLabel()
        self.addArtistLabel()
        self.addReleaseDateLabel()
        self.addGenreLabel()
        self.addGenreValueLabel()
        self.addCopyRightLabel()
     }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.updateNavigationBar()
        self.showData()
    }
    // MARK: - Showing Data to repective fields
    private func showData(){
        
        imgArtWork?.downloadImageFrom(link: selectedAlbum.artWorkUrl)
        lblAlbumName.text  = selectedAlbum.albumName
        lblArtist.text     = selectedAlbum.artistName
        lblDate.text       = selectedAlbum.releaseDate
        lblCopyRight.text  = selectedAlbum.copyRight
        lblGenre.text      = "Genre"
        lblGenreValue.text = self.getGenreComaSeprated()
        self.addSepratorView()
        self.addSepratorViewGenere()
        self.addButtonView()
        loadingView.hideLoadingView()
    }
    
    // MARK: - Genrating comaseprated Genres from List
    private func getGenreComaSeprated() -> String{
        let name : [String] = selectedAlbum.genres.map { $0.name }
        let joinedString = name.joined(separator: ", ")
        return joinedString
    }
    
    // MARK: - Clearing top Navigation bar
    private func updateNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    // MARK: - User action to open URL to iTune Store
    @IBAction func clickViewIniTune(sender:UIButton){
        guard let url = URL(string: selectedAlbum.artistUrl) else { return }
        print("itune Url : >>",url)
        UIApplication.shared.open(url)
    }
    
    // MARK: - Adding Loading view with constraint
    private func addLoadingView() {
        loadingView = LoadingView(frame: self.view.frame)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.isHidden = false
        self.view.addSubview(loadingView)
        self.setUpLoadingView()
    }
    private func setUpLoadingView() {
        let horConstraint = NSLayoutConstraint(item: loadingView!, attribute: .centerX, relatedBy: .equal,
                                               toItem: self.view, attribute: .centerX,
                                               multiplier: 1.0, constant: 0.0)
        let verConstraint = NSLayoutConstraint(item: loadingView!, attribute: .centerY, relatedBy: .equal,
                                               toItem: self.view, attribute: .centerY,
                                               multiplier: 1.0, constant: 0.0)
        let widConstraint = NSLayoutConstraint(item: loadingView!, attribute: .width, relatedBy: .equal,
                                               toItem: self.view, attribute: .width,
                                               multiplier: 0.1, constant: 0.0)
        let heiConstraint = NSLayoutConstraint(item: loadingView!, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height,
                                               multiplier: 0.1, constant: 0.0)
        
        view.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
        
    }
    

// MARK: - Adding ImageView  with constraint
    private func addImageView() {
        imgArtWork = LargeImageView.init(frame: self.view.frame)
        imgArtWork.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imgArtWork)
        self.setUpImgArtWork()

    }
    private func setUpImgArtWork() {
        let horConstraint = NSLayoutConstraint(item: imgArtWork!, attribute: .leading, relatedBy: .equal,
                                               toItem: self.view, attribute: .leading,
                                               multiplier: 1.0, constant: 0.0)
        let verConstraint = NSLayoutConstraint(item: imgArtWork!, attribute: .top, relatedBy: .equal,
                                               toItem: self.view, attribute: .top,
                                               multiplier: 1.0, constant: 0.0)
        let widConstraint = NSLayoutConstraint(item: imgArtWork!, attribute: .width, relatedBy: .equal,
                                               toItem: self.view, attribute: .width,
                                               multiplier: 1.0, constant: 0.0)
        let heiConstraint = NSLayoutConstraint(item: imgArtWork!, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height,
                                               multiplier: 0.3, constant: 0.0)
        
        view.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
    }
    
    // MARK: - Adding Album Label  with constraint
   private func addAlbumLabel() {
        lblAlbumName = CustomLabels()
        lblAlbumName.translatesAutoresizingMaskIntoConstraints = false
        lblAlbumName.setStyleLarge()
        self.view.addSubview(lblAlbumName)
        self.setUpAlbumLabel()

    }
    private func setUpAlbumLabel() {
        let horConstraint = NSLayoutConstraint(item: lblAlbumName!, attribute: .leading, relatedBy: .equal,
                                               toItem: self.view, attribute: .leading,
                                               multiplier: 1.0, constant: 10.0)
        let verConstraint = NSLayoutConstraint(item: lblAlbumName!, attribute: .top, relatedBy: .equal,
                                               toItem: imgArtWork, attribute: .bottom,
                                               multiplier: 1.0, constant: 10.0)
        let widConstraint = NSLayoutConstraint(item: lblAlbumName!, attribute: .width, relatedBy: .equal,
                                               toItem: view, attribute: .width,
                                               multiplier: 0.95, constant: 0.0)
        let heiConstraint = NSLayoutConstraint(item: lblAlbumName!, attribute: .height, relatedBy: .equal,
                                               toItem: view, attribute: .height,
                                               multiplier: 0.0675, constant: 0.0)
        
        view.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
    }
    
    // MARK: - Adding Artist Label  with constraint
    private func addArtistLabel() {
        lblArtist = CustomLabels()
        lblArtist.translatesAutoresizingMaskIntoConstraints = false
        lblArtist.setStyleMedium()
        self.view.addSubview(lblArtist)
        self.setUpArtistLabel()
    }
    private func setUpArtistLabel() {
        let horConstraint = NSLayoutConstraint(item: lblArtist!, attribute: .leading, relatedBy: .equal,
                                               toItem: self.view, attribute: .leading,
                                               multiplier: 1.0, constant: 10.0)
        let verConstraint = NSLayoutConstraint(item: lblArtist!, attribute: .top, relatedBy: .equal,
                                               toItem: lblAlbumName, attribute: .bottom,
                                               multiplier: 1.0, constant: 8.0)
        let widConstraint = NSLayoutConstraint(item: lblAlbumName!, attribute: .width, relatedBy: .equal,
                                               toItem: view, attribute: .width,
                                               multiplier: 0.95, constant: 0.0)
        let heiConstraint = NSLayoutConstraint(item: lblAlbumName!, attribute: .height, relatedBy: .equal,
                                               toItem: view, attribute: .height,
                                               multiplier: 1.0, constant: 20)
        
        view.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
        
    }
    // MARK: - Adding Seprerator Line with constraint
    private func addSepratorView() {
        sepratorView = SepratorView.init(frame: self.view.frame)
        sepratorView.translatesAutoresizingMaskIntoConstraints = false
        sepratorView.backgroundColor = UIColor.darkGray
        self.view.addSubview(sepratorView)
        self.setUpSepratorView()
    }
    private func setUpSepratorView() {
        let horConstraint = NSLayoutConstraint(item: sepratorView!, attribute: .leading, relatedBy: .equal,
                                               toItem: self.view, attribute: .leading,
                                               multiplier: 1.0, constant: 5.0)
        let verConstraint = NSLayoutConstraint(item: sepratorView!, attribute: .top, relatedBy: .equal,
                                               toItem: lblArtist, attribute: .bottom,
                                               multiplier: 1.0, constant: 4.0)
        let widConstraint = NSLayoutConstraint(item: sepratorView!, attribute: .trailing, relatedBy: .equal,
                                               toItem: self.view, attribute: .trailing,
                                               multiplier: 1.0, constant: -5.0)
        let heiConstraint = NSLayoutConstraint(item: sepratorView!, attribute: .height, relatedBy: .equal,
                                               toItem: nil, attribute: .notAnAttribute,
                                               multiplier: 1.0, constant: 1.0)
        
        view.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
        
    }
    // MARK: - Adding Date Label with constraint
    private func addReleaseDateLabel() {
        lblDate = CustomLabels()
        lblDate.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblDate)
        self.setUpDateLabel()
    }
    private func setUpDateLabel() {
        let horConstraint = NSLayoutConstraint(item: lblDate!, attribute: .trailing, relatedBy: .equal,
                                               toItem: self.view, attribute: .trailing,
                                               multiplier: 1.0, constant: -10.0)
        let verConstraint = NSLayoutConstraint(item: lblDate!, attribute: .centerY, relatedBy: .equal,
                                               toItem: lblArtist, attribute: .centerY,
                                               multiplier: 1.0, constant: 0.0)
        let widConstraint = NSLayoutConstraint(item: lblDate!, attribute: .width, relatedBy: .equal,
                                               toItem: nil, attribute: .notAnAttribute,
                                               multiplier: 1.0, constant: 100.0)
        let heiConstraint = NSLayoutConstraint(item: lblDate!, attribute: .height, relatedBy: .equal,
                                               toItem: nil, attribute: .notAnAttribute,
                                               multiplier: 1.0, constant: 30.0)
        
        view.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
        
    }
    
    // MARK: - Adding Genre Caption Label with constraint
    private func addGenreLabel() {
        lblGenre = CustomLabels()
        lblGenre.translatesAutoresizingMaskIntoConstraints = false
        lblGenre.setStyleLarge()
        self.view.addSubview(lblGenre)
        self.setUpGenreLabel()
    }
    private func setUpGenreLabel() {
        let horConstraint = NSLayoutConstraint(item: lblGenre!, attribute: .leading, relatedBy: .equal,
                                               toItem: self.view, attribute: .leading,
                                               multiplier: 1.0, constant: 10.0)
        let verConstraint = NSLayoutConstraint(item: lblGenre!, attribute: .top, relatedBy: .equal,
                                               toItem: lblArtist, attribute: .bottom,
                                               multiplier: 1.0, constant: 10.0)
        let widConstraint = NSLayoutConstraint(item: lblGenre!, attribute: .trailing, relatedBy: .equal,
                                               toItem: self.view, attribute: .trailing,
                                               multiplier: 1.0, constant:-10.0)
        let heiConstraint = NSLayoutConstraint(item: lblGenre!, attribute: .height, relatedBy: .equal,
                                               toItem: nil, attribute: .notAnAttribute,
                                               multiplier: 1.0, constant: 40.0)
        
        view.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
        
    }
    
    // MARK: - Adding Genere value Label to display comaseprated string Line with constraint
    private func addGenreValueLabel() {
        lblGenreValue = CustomLabels()
        lblGenreValue.translatesAutoresizingMaskIntoConstraints = false
        
        lblGenreValue.setStyleMedium()
        self.view.addSubview(lblGenreValue)
        self.setUpGenreValueLabel()
    }
    private func setUpGenreValueLabel() {
        let horConstraint = NSLayoutConstraint(item: lblGenreValue!, attribute: .leading, relatedBy: .equal,
                                               toItem: self.view, attribute: .leading,
                                               multiplier: 1.0, constant: 10.0)
        let verConstraint = NSLayoutConstraint(item: lblGenreValue!, attribute: .top, relatedBy: .equal,
                                               toItem: lblGenre, attribute: .bottom,
                                               multiplier: 1.0, constant: 3.0)
        let widConstraint = NSLayoutConstraint(item: lblGenreValue!, attribute: .trailing, relatedBy: .equal,
                                               toItem: self.view, attribute: .trailing,
                                               multiplier: 1.0, constant:-10.0)
        let heiConstraint = NSLayoutConstraint(item: lblGenreValue!, attribute: .height, relatedBy: .equal,
                                               toItem: nil, attribute: .notAnAttribute,
                                               multiplier: 1.0, constant: 30.0)
        
        view.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
        
    }
    
    // MARK: - Adding Seprerator Line with constraint
    private func addSepratorViewGenere() {
        sepViewGenre = SepratorView.init(frame: self.view.frame)
        sepViewGenre.translatesAutoresizingMaskIntoConstraints = false
        sepViewGenre.backgroundColor = UIColor.darkGray
        self.view.addSubview(sepViewGenre)
        self.setUpSepratorViewGenre()
    }
    private func setUpSepratorViewGenre() {
        let horConstraint = NSLayoutConstraint(item: sepViewGenre!, attribute: .leading, relatedBy: .equal,
                                               toItem: self.view, attribute: .leading,
                                               multiplier: 1.0, constant: 5.0)
        let verConstraint = NSLayoutConstraint(item: sepViewGenre!, attribute: .top, relatedBy: .equal,
                                               toItem: lblGenreValue, attribute: .bottom,
                                               multiplier: 1.0, constant: 3.0)
        let widConstraint = NSLayoutConstraint(item: sepViewGenre!, attribute: .trailing, relatedBy: .equal,
                                               toItem: self.view, attribute: .trailing,
                                               multiplier: 1.0, constant: -5.0)
        let heiConstraint = NSLayoutConstraint(item: sepViewGenre!, attribute: .height, relatedBy: .equal,
                                               toItem: nil, attribute: .notAnAttribute,
                                               multiplier: 1.0, constant: 1.0)
        
        view.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
        
    }
    // MARK: - Adding Copyright Label with constraint
    private func addCopyRightLabel() {
        lblCopyRight = CustomLabels()
        lblCopyRight.translatesAutoresizingMaskIntoConstraints = false
        lblCopyRight.setCopyrightStyle()
        self.view.addSubview(lblCopyRight)
        
        self.setUpCopyRightLabel()
        
    }
    private func setUpCopyRightLabel() {
        let horConstraint = NSLayoutConstraint(item: lblCopyRight!, attribute: .centerX, relatedBy: .equal,
                                               toItem: self.view, attribute: .centerX,
                                               multiplier: 1.0, constant: 0.0)
        let verConstraint = NSLayoutConstraint(item: lblCopyRight!, attribute: .top, relatedBy: .equal,
                                               toItem: lblGenreValue, attribute: .bottom,
                                               multiplier: 1.0, constant: 4.0)
        let widConstraint = NSLayoutConstraint(item: lblCopyRight!, attribute: .trailing, relatedBy: .equal,
                                               toItem: self.view, attribute: .trailing,
                                               multiplier: 1.0, constant: -10.0)
        let heiConstraint = NSLayoutConstraint(item: lblCopyRight!, attribute: .height, relatedBy: .equal,
                                               toItem: nil, attribute: .notAnAttribute,
                                               multiplier: 1.0, constant: 60.0)
        
        view.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
        
    }
    // MARK: - Adding Button with constraint
    private func addButtonView(){
        btnItune = CustomButtons()
        btnItune.translatesAutoresizingMaskIntoConstraints = false
        btnItune.setTitle("View in iTune Store", for: .normal)
        btnItune.setViewButtonStyle()
        btnItune.addTarget(self, action: #selector(clickViewIniTune), for: .touchUpInside)
        self.view.addSubview(btnItune)
        self.setUpButtonView()
    }
    private func setUpButtonView() {
        let horConstraint = NSLayoutConstraint(item: btnItune!, attribute: .centerX, relatedBy: .equal,
                                               toItem: self.view, attribute: .centerX,
                                               multiplier: 1.0, constant: 0.0)
        let verConstraint = NSLayoutConstraint(item: btnItune!, attribute: .bottom, relatedBy: .equal,
                                               toItem: self.view, attribute: .bottom,
                                               multiplier: 1.0, constant: -20.0)
        let widConstraint = NSLayoutConstraint(item: btnItune!, attribute: .trailing, relatedBy: .equal,
                                               toItem: self.view, attribute: .trailing,
                                               multiplier: 1.0, constant: -10.0)
        let heiConstraint = NSLayoutConstraint(item: btnItune!, attribute: .height, relatedBy: .equal,
                                               toItem: nil, attribute: .notAnAttribute,
                                               multiplier: 1.0, constant: 40.0)
        
        view.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
        
    }


}
