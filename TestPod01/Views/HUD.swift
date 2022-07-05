//
//  HUD.swift
//  TestPod01
//
//  Created by Sumetha on 5/7/22.
//

import UIKit

public class HUD: UIView {
    
    private(set) lazy var indicator : UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .white
        view.hidesWhenStopped = true
        return view
    }()
    
    private(set) lazy var label : UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 1
        view.text = "Loading..."
        return view
    }()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    public init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 200),
            heightAnchor.constraint(equalToConstant: 200),
        ])
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            label.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50),
        ])
        
        self.backgroundColor = .black.withAlphaComponent(0.67)
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
    }
    
    public func show(on parentView : UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(self)
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor),
        ])
    }
    
    public func hide() {
        self.removeFromSuperview()
    }

}
