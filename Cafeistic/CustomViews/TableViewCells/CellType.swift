//
//  TableViewCellType.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 11.05.2021.
//

import Foundation
import UIKit

enum TableViewCellType {
    case label(title: String,
               color: UIColor?,
               textFont: UIFont?)
    case textField(style: MainTextFieldStyle,
                   title: String? = nil,
                   placeholder: String? = nil,
                   font: UIFont? = nil,
                   textColor: UIColor? = nil)
    case button(style: MainButtonStyle,
                title: String)
    
    func cell(tableView: UITableView, indexPath: IndexPath, delegate: TableViewCellActionsDelegate) -> UITableViewCell {
        
        switch self {
        case .label(let title, let color, let font):
            let cell = tableView.dequeueReusableCell(indexPath: indexPath) as TableViewLabelCell
            cell.title = title
            cell.color = color
            cell.textFont = font
            return cell
        case .textField(let style, let title, let placeholder, let font, let textColor):
            let cell = tableView.dequeueReusableCell(indexPath: indexPath) as TableViewTextFieldCell
            cell.style = style
            cell.title = title
            cell.placeholder = placeholder
            cell.textFont = font
            cell.color = textColor
            return cell
        case .button(let style, let title):
            let cell = tableView.dequeueReusableCell(indexPath: indexPath) as TableViewButtonCell
            cell.style = style
            cell.title = title
            cell.delegate = delegate as? TableViewButtonCellDelegate
            return cell
        }
    }
}
