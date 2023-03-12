//
//  CreateGoalVC.swift
//  Goals
//
//  Created by Vadim Kononenko on 11.03.2023.
//

import UIKit
import SnapKit

class CreateGoalVC: UIViewController {
    
    //MARK: - Views
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "back"), for: .normal)
//        button.addTarget(self, action: #selector(addGoal), for: .touchUpInside)
        return button
    }()
    
    private let goalTextView: UITextView = {
        let textView = UITextView()
        textView.text = "What is your goal?"
        textView.font = .systemFont(ofSize: 18, weight: .semibold)
        textView.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return textView
    }()
    
    private let selectLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = "Select One:"
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return label
    }()
    
    private let shortTermButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.setTitle("SHORT TERM", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4274509804, green: 0.737254902, blue: 0.3882352941, alpha: 1)
        return button
    }()
    
    private let longTermButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.setTitle("LONG TERM", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.8666666667, blue: 0.6862745098, alpha: 1)
        return button
    }()
    
    private let termStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    private let allStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .orange
        return button
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

}

//MARK: - Configure
extension CreateGoalVC {
    private func configure() {
        setupViews()
        setupConstraints()
        
        view.backgroundColor = .white
        
        navigationItem.titleView = NavTitle()
    }
    
    private func setupViews() {
        view.addSubview(allStackView)
        
        allStackView.addArrangedSubview(goalTextView)
        allStackView.addArrangedSubview(selectLabel)
        allStackView.addArrangedSubview(termStackView)
        
        termStackView.addArrangedSubview(shortTermButton)
        termStackView.addArrangedSubview(longTermButton)
        
        view.addSubview(nextButton)
    }
    
    private func setupConstraints() {
        allStackView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(350)
        }
        nextButton.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
    }
}
