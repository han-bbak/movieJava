package store.model.vo;

public class Search {
	private String search;
	
	public Search() {}

	public Search(String search) {
		super();
		this.search = search;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	@Override
	public String toString() {
		return "Search [search=" + search + "]";
	}

	
}
