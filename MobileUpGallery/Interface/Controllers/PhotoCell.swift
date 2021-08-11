//
//  PhotoCell.swift
//  MobileUpGallery
//
//  Created by Alexander Morozkov on 08.08.2021.
//

import UIKit

protocol PhotoCellViewModel {
    var photoUrlString: String { get }
}

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var urlView: WebImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(viewModel: PhotoCellViewModel) {
        urlView.setImageUrl(imageURL: viewModel.photoUrlString)
    }
}
