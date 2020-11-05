//
//  SwipeCardOverlay.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-01.
//

import Foundation
import Shuffle_iOS

class SwipeCardOverlay: UIView {

      init(direction: SwipeDirection) {
        super.init(frame: .zero)
        switch direction {
        case .left:
          createLeftOverlay()
        case .up:
          createUpOverlay()
        case .right:
          createRightOverlay()
        default:
          break
        }
      }

      required init?(coder: NSCoder) {
        return nil
      }

      private func createLeftOverlay() {
        let leftTextView = TinderCardOverlayLabelView(withTitle: "REPLAY",
                                                      color: .sampleRed,
                                                      rotation: CGFloat.pi / 10)
        addSubview(leftTextView)
        leftTextView.anchor(top: topAnchor,
                            right: rightAnchor,
                            paddingTop: 30,
                            paddingRight: 14)
      }

      private func createUpOverlay() {
        let upTextView = TinderCardOverlayLabelView(withTitle: "I AM GOOD",
                                                    color: .sampleBlue,
                                                    rotation: -CGFloat.pi / 20)
        addSubview(upTextView)
        upTextView.anchor(bottom: bottomAnchor, paddingBottom: 20)
        upTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
      }

      private func createRightOverlay() {
        let rightTextView = TinderCardOverlayLabelView(withTitle: "NEXT",
                                                       color: .sampleGreen,
                                                       rotation: -CGFloat.pi / 10)
        addSubview(rightTextView)
        rightTextView.anchor(top: topAnchor,
                             left: leftAnchor,
                             paddingTop: 26,
                             paddingLeft: 14)
      }
    }

    private class TinderCardOverlayLabelView: UIView {

      private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
      }()

      init(withTitle title: String, color: UIColor, rotation: CGFloat) {
        super.init(frame: CGRect.zero)
        layer.borderColor = color.cgColor
        layer.borderWidth = 4
        layer.cornerRadius = 4
        transform = CGAffineTransform(rotationAngle: rotation)

        addSubview(titleLabel)
        titleLabel.textColor = color
        titleLabel.attributedText = NSAttributedString(string: title,
                                                       attributes: NSAttributedString.Key.overlayAttributes)
        titleLabel.anchor(top: topAnchor,
                          left: leftAnchor,
                          bottom: bottomAnchor,
                          right: rightAnchor,
                          paddingLeft: 8,
                          paddingRight: 3)
      }

      required init?(coder aDecoder: NSCoder) {
        return nil
      }
    }

