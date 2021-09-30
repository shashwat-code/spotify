//
//  ProfileViewController.swift
//  spotify
//
//  Created by Shashwat on 28/09/21.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController {

    
    private var userDetail = [[String]]()
    var tableView:UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        fetchUserProfile()
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func fetchUserProfile(){
        APICaller.shared.getCurrentProfile {[weak self] result in
            print(result)
            DispatchQueue.main.async {
                switch result{
                case .success(let model):
                    self?.UpdateUI(with: model)
                    break
                case .failure(let error):
                    print("error inside: \(error)")
                    self?.failedtoLoad()
                }
            }
    }
    }
    func addImage(){
        let url = "https://blog.prepscholar.com/hs-fs/hubfs/body_s3.jpg?width=640&name=body_s3.jpg"
        let urlString = URL(string: url)
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.width/1.5))
        let profileImage = UIImageView(frame: CGRect(x: 0, y: 0, width: header.height/2, height: header.height/2))
        profileImage.center = header.center
        profileImage.sd_setImage(with: urlString, completed: nil)
        profileImage.layer.masksToBounds = true
        profileImage.contentMode = .scaleToFill
        profileImage.layer.cornerRadius = header.height/4
        header.addSubview(profileImage)
        tableView.tableHeaderView = header
    }
    
    private func UpdateUI(with model: UserProfile){
        tableView.isHidden = false
        userDetail.append(["Username",model.id])
        userDetail.append(["Name",model.display_name])
        userDetail.append(["Country",model.country])
        userDetail.append(["Product",model.product])
        addImage()
        tableView.reloadData()
    }
    
    private func failedtoLoad(){
        let label = UILabel()
        label.text = "Failed to fetch Profile"
        label.textColor = .secondaryLabel
        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center
    }
}

extension ProfileViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.detailTextLabel?.text = userDetail[indexPath.row][1]
        cell.textLabel?.text = userDetail[indexPath.row][0]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


