//
//  RadioOptionView.swift
//  TestPod01
//
//  Created by Sumetha on 5/7/22.
//

import UIKit

public protocol RadioOptionViewDelegate : AnyObject {
    func radio(optionView : RadioOptionView, didSelect flag : Bool)
}

public class RadioOptionView: UIView {
    
    @IBOutlet weak var radioImageView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var button : UIButton!
    
    private var isConfigured : Bool = false
    
    public weak var delegate : RadioOptionViewDelegate?
    
    public var isSelected : Bool = false {
        didSet {
            guard isConfigured else { return }
            updateRadioImage()
        }
    }
    public var title : String = "" {
        didSet {
            guard isConfigured else { return }
            updateTitle()
        }
    }
    
    public var value : Any?
    
    public static func instanceFromNib(bundle : Bundle? = nil) -> RadioOptionView {
        UINib(nibName: self.identifier, bundle: bundle ?? Bundle(for: self.classForCoder()))
            .instantiate(withOwner: self)[0] as! RadioOptionView
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        radioImageView.tintColor = .systemBlue
        
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 4
        titleLabel.textColor = .label
        
        updateRadioImage()
        updateTitle()
        isConfigured = true
    }
    
    private func updateRadioImage() {
        let name = isSelected ? "circle.fill" : "circle"
        guaranteeMainThread {
            self.radioImageView.image = .init(systemName: name)
        }
    }
    private func updateTitle() {
        guaranteeMainThread {
            self.titleLabel.text = self.title
        }
    }

    //MARK: - Actions
    @IBAction func didTapAction() {
        isSelected = !isSelected
        delegate?.radio(optionView: self, didSelect: isSelected)
    }
}
