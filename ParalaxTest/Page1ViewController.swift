

import UIKit

@objc(Page1ViewController)
class Page1ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  let cellIndentifier = "cell"
  let NAVBAR_CHANGE_POINT:CGFloat = 50
  
  @IBOutlet weak var tableView: UITableView!
  var topView:UIView!
  var topImageView: UIImageView?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "sdfsdf"), animated: true)
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIndentifier)
    self.navigationController?.navigationBar.lt_setBackgroundColor(UIColor.clearColor())
    
    tableView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleWidth
    
    topView = UIView(frame: CGRectMake(0, 0, 320, 212))
    topView.contentMode = UIViewContentMode.ScaleToFill
    topView.autoresizesSubviews = true
    topView.backgroundColor = UIColor.yellowColor()
   // topView.clipsToBounds = true
    
  //  tableView.tableHeaderView = topView
//    tableView.backgroundView = testView
    
    tableView.addSubview(topView)
    
  
    let img = UIImage(named: "bg")
    topImageView = UIImageView(image: img)
    topImageView?.frame = CGRectMake(0, -89, 320, 307)
    topImageView?.contentMode = UIViewContentMode.ScaleToFill
    topView.addSubview(topImageView!)

    topView.superview?.sendSubviewToBack(topView)
    
    
    
  }
  
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
    let color: UIColor = UIColor(red: 0/255, green: 175/255, blue: 240/255, alpha: 1)
    let offsetY:CGFloat = scrollView.contentOffset.y
    if offsetY > NAVBAR_CHANGE_POINT {
      let alpha:CGFloat = 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64)
      self.navigationController?.navigationBar.lt_setBackgroundColor(color.colorWithAlphaComponent(alpha))
    }
    else {
      self.navigationController?.navigationBar.lt_setBackgroundColor(color.colorWithAlphaComponent(0))
    }
    
    if offsetY < 0 {
      let progress:CGFloat = fabs(offsetY) / 300
      self.topImageView?.transform = CGAffineTransformMakeScale(1 + progress, 1 + progress)
    }
  }
  
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
        
  }
  
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.scrollViewDidScroll(self.tableView)
    self.navigationController?.navigationBar.shadowImage = UIImage()
  }
 
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.navigationBar.lt_reset()
  }
  
  
  // MARK: UITableViewDataSource
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 30
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIndentifier, forIndexPath: indexPath) as! UITableViewCell
    cell.textLabel!.text = "text \(indexPath.row)"
    return cell
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 65
  }
  
 
  
  // MARK: UITableViewDelegate
  
  
  
  
}
