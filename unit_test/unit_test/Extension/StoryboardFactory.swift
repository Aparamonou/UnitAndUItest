//
//  StoryboardFactory.swift
//  unit_test
//
//  Created by Alex Paramonov on 7.01.22.
//

import UIKit

extension UIViewController {
     
     func getViewController( _ idStoryBoard: String, nameViewController: String) -> UIViewController {
          
          let storyBoard = UIStoryboard(name: idStoryBoard, bundle: nil)
          let currentStory = storyBoard.instantiateViewController(withIdentifier: nameViewController)
          currentStory.modalTransitionStyle = .crossDissolve
          currentStory.modalPresentationStyle = .fullScreen
          return currentStory
     }

}
