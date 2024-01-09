//
//  NewsCell.swift
//  News
//
//  Created by Personal on 09/01/2024.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet private weak var labelTitle: UILabel?
    @IBOutlet private weak var labelDescription: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with news: News) {
        labelTitle?.text = news.title
        labelDescription?.text = news.description
    }
}
