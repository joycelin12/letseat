//
//  NoDataView.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 6/23/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import UIKit

class NoDataView: UIView {

    var view: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDesc: UILabel!
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupView()
    
    }
    
    required init? (coder aDecoder: NSCoder) {
    
        super.init(coder: aDecoder)
        setupView()
    }
    
    func loadViewFrokNib() -> UIView {
    
        let nib = UINib(nibName: "NoDataView", bundle: Bundle.main)
        let view = nib.instantiate(withOwner: self, options: nil) [0]
        as! UIView
        return view
    }
    
    func setupView() {
        view = loadViewFrokNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func set(title: String) {
    
        lblTitle.text = title
    }
    
    func set(desc: String)
    {
        lblDesc.text = desc
    }
}
