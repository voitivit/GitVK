
import UIKit
class NewGroupTableViewController: UITableViewController, UISearchResultsUpdating {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
    }

    var searchController:UISearchController!
    var GroupsList: [Group] = []
    
    lazy var imageCache = ImageCache(container: self.tableView) //для кэша картинок
    
    // MARK: - Functions
    
    func setupSearchBar() {
        //панель поиска через код
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Введите запрос для поиска"
        //searchController.searchBar.text = "Swift"
        tableView.tableHeaderView = searchController.searchBar
        searchController.obscuresBackgroundDuringPresentation = false // не скрывать таблицу под поиском (размытие), иначе не будет работать сегвей из поиска
        
        //автоматическое открытие клавиатуры для поиска
        searchController.isActive = true
        DispatchQueue.main.async {
          self.searchController.searchBar.becomeFirstResponder()
        }
    }
    
    func searchGroupVK(searchText: String) {
        // получение данный json в зависимости от требования
        SearchGroup().loadData(searchText: searchText) { [weak self] (complition) in
            DispatchQueue.main.async {
                //print(complition)
                self?.GroupsList = complition
                self?.tableView.reloadData()
            }
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            searchGroupVK(searchText: searchText)
        }
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GroupsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddGroup", for: indexPath)  as! NewGroupTableViewCell

        cell.nameNewGroupLabel.text = GroupsList[indexPath.row].groupName
        
        // работает через extension UIImageView
//        if let imgUrl = URL(string: GroupsList[indexPath.row].groupLogo) {
//            cell.avatarNewGroupView.avatarImage.load(url: imgUrl)
//        }
        
        // аватар работает через кэш в ImageCache
        let imgUrl = GroupsList[indexPath.row].groupLogo
        cell.avatarNewGroupView.avatarImage.image = imageCache.getPhoto(at: indexPath, url: imgUrl)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // для избавления смешивания цветов для разных слоёв (имя группы имеет белый фон в строриборде), меняем его при нажатии
        let cell = tableView.cellForRow(at: indexPath) as! NewGroupTableViewCell
        cell.nameNewGroupLabel.backgroundColor = cell.backgroundColor
        // кратковременное подсвечивание при нажатии на ячейку
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
