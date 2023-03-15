//
//  FinishGoalVC.swift
//  Goals
//
//  Created by Vadim Kononenko on 14.03.2023.
//

import UIKit
import SnapKit
import CoreData

class FinishGoalVC: UIViewController {
    
    //MARK: - Variables
    private var goalDesription: String!
    private var goalType: GoalType!
    
    //MARK: - Views
    private let questionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 18, weight: .semibold)
        lbl.text = "How many points until complete?"
        return lbl
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 54, weight: .bold)
        textField.textColor = #colorLiteral(red: 0.4922490716, green: 0.7722237706, blue: 0.4631416798, alpha: 1)
        textField.borderStyle = .none
        textField.keyboardType = .numberPad
        textField.placeholder = "0"
        return textField
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    
    private lazy var createGoalBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("CREATE GOAL", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        btn.backgroundColor = .orange
        btn.addTarget(self, action: #selector(createGoal), for: .touchUpInside)
        return btn
    }()
    
    ///
    /// to make my create button not to slide down after enter number
    ///
    private let containterView = UIView()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Actions
    @objc private func createGoal() {
        if textField.text != "" {
            save { completed in
                if completed {
                    navigationController?.popToRootViewController(animated: true)
                }
            }
        }
    }
    
    private func save(complition: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDesription
        goal.goalType = goalType.rawValue
        goal.goalComplitionValue = Int32(textField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            complition(true)
        } catch {
            print(error.localizedDescription)
            complition(false)
        }
    }
    
    func initData(description: String, type: GoalType) {
        self.goalDesription = description
        self.goalType = type
    }

}

//MARK: - Configure views
extension FinishGoalVC {
    private func configure() {
        setupViews()
        setupConstraints()
        
        view.backgroundColor = .white
        
        navigationItem.titleView = NavTitle()
        
        createGoalBtn.bindToKeyboard()
    }
    
    private func setupViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(questionLabel)
        stackView.addArrangedSubview(textField)
        
        view.addSubview(containterView)
        containterView.addSubview(createGoalBtn)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(110)
        }
        containterView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
        }
        createGoalBtn.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
    }
}

extension FinishGoalVC: UITextViewDelegate {
    
}
