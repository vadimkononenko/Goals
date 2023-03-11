//
//  GoalCell.swift
//  Goals
//
//  Created by Vadim Kononenko on 10.03.2023.
//

import UIKit
import SnapKit

class GoalCell: UITableViewCell {
    
    //MARK: - reuseId
    static let reuseId = String(describing: GoalCell.self)
    
    
    //MARK: - views
    private let goalLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "Goal:"
        return label
    }()
    
    private let goalDescLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "Label"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type:"
        return label
    }()
    
    private let typeDescLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()
    
    private let goalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
    }()
    
    private let typeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private let cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let goalProgressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.text = "7"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.4274509804, green: 0.737254902, blue: 0.3882352941, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()

    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - configure cell
    func configureCell(description: String, type: String, goalProgressAmount: Int) {
        self.goalDescLabel.text = description
        self.typeDescLabel.text = type
        self.goalProgressLabel.text = String(describing: goalProgressAmount)
    }
    
}

extension GoalCell {
    //MARK: - configure views
    private func configure() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        goalStackView.addArrangedSubview(goalLabel)
        goalStackView.addArrangedSubview(goalDescLabel)
        
        typeStackView.addArrangedSubview(typeLabel)
        typeStackView.addArrangedSubview(typeDescLabel)
        
        addSubview(cellStackView)
        cellStackView.addArrangedSubview(goalStackView)
        cellStackView.addArrangedSubview(typeStackView)
        
        addSubview(goalProgressLabel)
    }
    
    private func setupConstraints() {
        cellStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalTo(goalProgressLabel.snp.leading).offset(-10)
        }
        goalProgressLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.trailing.equalToSuperview().offset(-8)
            make.width.equalTo(40)
        }
    }
}
