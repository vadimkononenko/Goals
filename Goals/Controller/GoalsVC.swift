//
//  GoalsVC.swift
//  Goals
//
//  Created by Vadim Kononenko on 05.03.2023.
//

import UIKit
import SnapKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {
    
    //MARK: - Variables
    private var goals: [Goal] = []
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetch { complete in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false
                    tableView.reloadData()
                } else {
                    tableView.isHidden = true
                }
            }
        }
    }
    
    //MARK: - Actions
    @objc private func addGoal() {
        let vc = CreateGoalVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension GoalsVC {
    //MARK: - Configure
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
    
    //MARK: - Fetch data
    private func fetch(complition: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            self.goals = try managedContext.fetch(fetchRequest)
            complition(true)
        } catch {
            debugPrint(error.localizedDescription)
            complition(false)
        }
    }
}

//MARK: - UITableViewDelegate
extension GoalsVC: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension GoalsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GoalCell.reuseId) as! GoalCell
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
}
