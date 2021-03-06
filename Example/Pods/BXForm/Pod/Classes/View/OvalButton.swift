//
//  OvalButton.swift
//  Pods
//
//  Created by Haizhen Lee on 15/12/29.
//
//


import UIKit

public class OvalButton:UIButton{
  
  public lazy var maskLayer : CAShapeLayer = { [unowned self] in
    let maskLayer = CAShapeLayer()
    maskLayer.frame = self.frame
    self.layer.mask = maskLayer
    return maskLayer
    }()
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    maskLayer.frame = bounds
    updateOutlinePath()
  }
  
  private func updateOutlinePath(){
    let path:UIBezierPath
    switch outlineStyle{
    case .Rounded:
      path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
    case .Oval:
      path = UIBezierPath(ovalInRect: bounds)
    case .Semicircle:
      path = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.height * 0.5)
    }
    maskLayer.path = path.CGPath
  }
  
  
  public var outlineStyle = BXOutlineStyle.Oval{
    didSet{
      updateOutlinePath()
    }
  }
  
  public var cornerRadius:CGFloat = 4.0 {
    didSet{
      updateOutlinePath()
    }
  }
}
