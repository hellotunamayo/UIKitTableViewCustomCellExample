//
//  CustomTableViewCell.swift
//  CustomUITableViewExample
//
//  Created by Minyoung Yoo on 10/8/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier: String = "CustomCell"
    private let customCellImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemBackground
        imageView.image = UIImage(systemName: "questionmark")
        imageView.tintColor = .label
        return imageView
    }()
    
    private let customCellLabelView = {
        let labelView: UILabel = UILabel()
        labelView.text = "Empty Label"
        labelView.textAlignment = .left
        labelView.font = .systemFont(ofSize: 16, weight: .medium)
        return labelView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureView(image: UIImage, label: String) {
        self.customCellImageView.image = image
        self.customCellLabelView.text = label
    }
    
    private func setupView() {
        let childViews: [UIView] = [customCellImageView, customCellLabelView]
        self.contentView.addSubviews(childViews: childViews)
        
        customCellImageView.translatesAutoresizingMaskIntoConstraints = false
        customCellLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //image
            customCellImageView.heightAnchor.constraint(equalToConstant: 90),
            customCellImageView.widthAnchor.constraint(equalToConstant: 90),
            customCellImageView.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            customCellImageView.centerYAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.centerYAnchor),
            
            //label
            customCellLabelView.centerYAnchor.constraint(equalTo: customCellImageView.centerYAnchor),
            customCellLabelView.leadingAnchor.constraint(equalTo: customCellImageView.trailingAnchor, constant: 20),
        ])
    }
    
}

#Preview {
    CustomTableViewCell()
}
