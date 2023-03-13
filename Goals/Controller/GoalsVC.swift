//
//  GoalsVC.swift
//  Goals
//
//  Created by Vadim Kononenko on 05.03.2023.
//

import UIKit
import SnapKit
import CoreData

class GoalsVC: UIViewController {
    
    //MARK: - Views
    private lazy var addGoalButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "addGoal"), for: .normal)
        button.addTarget(self, action: #selector(addGoal), for: .touchUpInside)
        return button
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.text = "Welcome to GoalPost"
        return label
    }()
    
    private let descriptionWelcomeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.text = "To begin, create a goal!"
        return label
    }()
    
    private let greetingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(GoalCell.self, forCellReuseIdentifier: GoalCell.reuseId)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Actions
    @objc private func addGoal() {
        let vc = CreateGoalVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Configure
extension GoalsVC {
    private func configure() {
        setupViews()
        setupConstraints()
        
        navigationItem.titleView = NavTitle()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addGoalButton)
        navigationItem.backButtonTitle = ""
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupViews() {
        view.addSubview(greetingStackView)
        greetingStackView.addArrangedSubview(welcomeLabel)
        greetingStackView.addArrangedSubview(descriptionWelcomeLabel)
        
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        greetingStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(95)
            make.centerY.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
}

//MARK: - UITableViewDelegate
extension GoalsVC: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension GoalsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GoalCell.reuseId) as! GoalCell
        cell.configureCell(description: "Description", type: .shortTerm, goalProgressAmount: 10)
        return cell
    }
}
