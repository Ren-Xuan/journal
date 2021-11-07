package renxuan.journal_dao.entity;

import java.io.File;
import java.io.OutputStream;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Article implements Comparable<Article>{
	private String article_id;	//char(10) to generate
	
	private String periodical_id;//char(10)
	
	private String user_id;		//char(10)
	
	private String author;		//char(45)
	private String title;		//char(45)
	private String keyword;		//char(45)
	private String summary;		//char(1024)
	
	private int stage;			//int :-1,0,1
	private String cover_path;
	private String cover_name;//
	private String file_path;	//
	private String file_name;	//
	private Integer viewer;	//
	 @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	 private Date time;
	 
	 private User user;			//
	 private Periodical periodical;	//
	public Article(String article_id, String periodical_id, String user_id, String author, String title, String keyword,
			String summary, int stage, String cover_path, String cover_name, String file_path, String file_name,
			Integer viewer, Date time, User user, Periodical periodical) {
		super();
		this.article_id = article_id;
		this.periodical_id = periodical_id;
		this.user_id = user_id;
		this.author = author;
		this.title = title;
		this.keyword = keyword;
		this.summary = summary;
		this.stage = stage;
		this.cover_path = cover_path;
		this.cover_name = cover_name;
		this.file_path = file_path;
		this.file_name = file_name;
		this.viewer = viewer;
		this.time = time;
		this.user = user;
		this.periodical = periodical;
	}
	public Article() {
		super();
		this.stage=0;
	}
	public String getArticle_id() {
		return article_id;
	}
	public String getPeriodical_id() {
		return periodical_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getAuthor() {
		return author;
	}
	public String getTitle() {
		return title;
	}
	public String getKeyword() {
		return keyword;
	}
	public String getSummary() {
		return summary;
	}
	public int getStage() {
		return stage;
	}
	public String getCover_path() {
		return cover_path;
	}
	public String getCover_name() {
		return cover_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public String getFile_name() {
		return file_name;
	}
	public Integer getViewer() {
		return viewer;
	}
	public Date getTime() {
		return time;
	}
	public User getUser() {
		return user;
	}
	public Periodical getPeriodical() {
		return periodical;
	}
	public void setArticle_id(String article_id) {
		this.article_id = article_id;
	}
	public void setPeriodical_id(String periodical_id) {
		this.periodical_id = periodical_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public void setStage(int stage) {
		this.stage = stage;
	}
	public void setCover_path(String cover_path) {
		this.cover_path = cover_path;
	}
	public void setCover_name(String cover_name) {
		this.cover_name = cover_name;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public void setViewer(Integer viewer) {
		this.viewer = viewer;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setPeriodical(Periodical periodical) {
		this.periodical = periodical;
	}
	@Override
	public String toString() {
		return "Article [article_id=" + article_id + ", periodical_id=" + periodical_id + ", user_id=" + user_id
				+ ", author=" + author + ", title=" + title + ", keyword=" + keyword + ", summary=" + summary
				+ ", stage=" + stage + ", cover_path=" + cover_path + ", cover_name=" + cover_name + ", file_path="
				+ file_path + ", file_name=" + file_name + ", viewer=" + viewer + ", time=" + time + ", user=" + user
				+ ", periodical=" + periodical + "]";
	}
	 
	
	@Override
	public int compareTo(Article o) {
		if( o.getArticle_id().equals(this.getArticle_id()))return 0;
		return -1;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((article_id == null) ? 0 : article_id.hashCode());
		result = prime * result + ((author == null) ? 0 : author.hashCode());
		result = prime * result + ((cover_name == null) ? 0 : cover_name.hashCode());
		result = prime * result + ((cover_path == null) ? 0 : cover_path.hashCode());
		result = prime * result + ((file_name == null) ? 0 : file_name.hashCode());
		result = prime * result + ((file_path == null) ? 0 : file_path.hashCode());
		result = prime * result + ((keyword == null) ? 0 : keyword.hashCode());
		result = prime * result + ((periodical == null) ? 0 : periodical.hashCode());
		result = prime * result + ((periodical_id == null) ? 0 : periodical_id.hashCode());
		result = prime * result + stage;
		result = prime * result + ((summary == null) ? 0 : summary.hashCode());
		result = prime * result + ((time == null) ? 0 : time.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((user == null) ? 0 : user.hashCode());
		result = prime * result + ((user_id == null) ? 0 : user_id.hashCode());
		result = prime * result + ((viewer == null) ? 0 : viewer.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Article other = (Article) obj;
		if (article_id == null) {
			if (other.article_id != null)
				return false;
		} else if (!article_id.equals(other.article_id))
			return false;
		
		return true;
	}
	
}
