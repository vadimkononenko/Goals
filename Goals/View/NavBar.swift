//
//  NavBar.swift
//  Goals
//
//  Created by Vadim Kononenko on 11.03.2023.
//

import UIKit
import SnapKit

class NavBar: UIView {
    
    //MARK: - Views
    private let goalLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "GOAL"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let postLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "POST"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let navTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NavBar {
    private func configure() {
        configureViews()
        configureConstraints()
    }
    
    private func configureViews() {
        backgroundColor = #colorLiteral(red: 0.4274509804, green: 0.737254902, blue: 0.3882352941, alpha: 1)
        
        addSubview(navTitleStackView)
        
        navTitleStackView.addArrangedSubview(goalLabel)
        navTitleStackView.addArrangedSubview(postLabel)
    }
    
    private func configureConstraints() {
        navTitleStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
