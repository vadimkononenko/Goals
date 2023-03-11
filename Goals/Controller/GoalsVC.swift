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
    private let navBarView = NavBar()
    
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
        print("button1")
    }
}

//MARK: - Configure
extension GoalsVC {
    private func configure() {
        setupViews()
        setupConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupViews() {
        view.addSubview(navBarView)
        
        navBarView.addSubview(addGoalButton)
        
        view.addSubview(greetingStackView)
        greetingStackView.addArrangedSubview(welcomeLabel)
        greetingStackView.addArrangedSubview(descriptionWelcomeLabel)
        
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        navBarView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(90)
        }
        addGoalButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-10)
        }
        greetingStackView.snp.makeConstraints { make in
            make.top.equalTo(navBarView.snp.bottom).offset(95)
            make.centerX.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navBarView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
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
