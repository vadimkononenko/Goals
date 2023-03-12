//
//  NavTitle.swift
//  Goals
//
//  Created by Vadim Kononenko on 11.03.2023.
//

import UIKit
import SnapKit

class NavTitle: UIView {
    
    //MARK: - Views
    private let goalLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "GOAL"
        label.textAlignment = .center
        return label
    }()
    
    private let postLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "POST"
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

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Configure
extension NavTitle {
    private func configure() {
        configureViews()
        configureConstraints()
    }
    
    private func configureViews() {
        addSubview(navTitleStackView)
        
        navTitleStackView.addArrangedSubview(goalLabel)
        navTitleStackView.addArrangedSubview(postLabel)
    }
    
    private func configureConstraints() {
        navTitleStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
