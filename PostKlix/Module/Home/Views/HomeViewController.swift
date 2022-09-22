//
//  HomeViewController.swift
//  PostKlix
//
//  Created by Anang Nugraha on 20/09/22.
//  
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: HomePresenterProtocol?
    @IBOutlet weak var homeTableView: UITableView!
    let refreshControl = UIRefreshControl()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupView()
        presenter?.fetchPost()
    }
    
    // MARK: - Setup
    private func setupView() {
        setupTableView()
        setupRefreshView()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapButton))
    }
    
    func setupTableView(){
        homeTableView.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.identifier)
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    @objc func didTapButton() {
        presenter?.moveToPostForm(id: nil)
    }
    
    func setupRefreshView() {
        refreshControl.attributedTitle = NSAttributedString(string: "Tarik untuk memperbarui")
        refreshControl.addTarget(self, action: #selector(self.refreshData(_:)), for: .valueChanged)
        homeTableView.addSubview(refreshControl)
    }
    
    @objc func refreshData(_ sender: AnyObject) {
        self.refreshControl.endRefreshing()
        self.homeTableView.reloadData()
        presenter?.fetchPost()
    }

}

// MARK: - View Protocol
extension HomeViewController: HomeViewProtocol {
    func reloadData() {
        homeTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.allPosts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell
        if let data = presenter?.allPosts?[indexPath.row] {
            cell?.configure(with: data)
        }
        cell?.selectionStyle = .none
        cell?.layoutIfNeeded()
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = presenter?.allPosts?[indexPath.row], let id = data.id {
            presenter?.movetoDetail(id: id)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") {  [weak self] (contextualAction, view, boolValue) in
            if let data = self?.presenter?.allPosts?[indexPath.row] {
                self?.presenter?.deletePost(post: data)
            }
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") {  [weak self] (contextualAction, view, boolValue) in
            if let data = self?.presenter?.allPosts?[indexPath.row], let id = data.id {
                self?.presenter?.moveToPostForm(id: id)
            }
        }
        edit.backgroundColor = .systemGreen
        let swipeActions = UISwipeActionsConfiguration(actions: [delete,edit])

        return swipeActions
    }
}
