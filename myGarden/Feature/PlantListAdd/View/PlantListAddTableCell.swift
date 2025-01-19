//
//  PlantListAddTableCell.swift
//  myGarden
//
//  Created by zeze kim on 1/20/25.
//

import UIKit
import SnapKit

final class PlantListAddTableCell: UITableViewCell {
    lazy var plantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var namelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(plantImageView)
        addSubview(namelabel)
        setConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setConfiguration(){
        plantImageView.snp.makeConstraints { make in
                make.width.height.equalTo(50)
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().offset(16)
            }
            
        namelabel.snp.makeConstraints { make in
                make.leading.equalTo(plantImageView.snp.trailing).offset(16)
                make.trailing.equalToSuperview().inset(16)
                make.centerY.equalToSuperview()
            }
    }
    
    func configure(with plant: Plant) {
        plantImageView.image = UIImage(named: plant.rtnThumbFileUrl ?? "")
        namelabel.text = plant.distbNm
    }
}
