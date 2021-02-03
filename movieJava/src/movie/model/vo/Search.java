package movie.model.vo;

public class Search {

	private String search;
	private String genre;
	private String sort;
	
	
	public Search(String search, String genre, String sort) {
		super();
		this.search = search;
		this.genre = genre;
		this.sort = sort;
	}


	public String getSearch() {
		return search;
	}


	public void setSearch(String search) {
		this.search = search;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}


	public String getSort() {
		return sort;
	}


	public void setSort(String sort) {
		this.sort = sort;
	}


	@Override
	public String toString() {
		return "Search [search=" + search + ", genre=" + genre + ", sort=" + sort + "]";
	}
	
	
	
	
	
	
}
