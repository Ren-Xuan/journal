package renxuan.journal_dao.entity;

import java.io.File;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Periodical {
	private String periodical_id;	//char(10)to generate
	private String cover_path;		//封面path
	private String cover_name;		//
	private String periodical_title;//char(45)
	private String preface;//char(1024)

	private List<Article> articles;

	public Periodical(String periodical_id, String cover_path, String cover_name, String periodical_title,
			String preface, List<Article> articles) {
		super();
		this.periodical_id = periodical_id;
		this.cover_path = cover_path;
		this.cover_name = cover_name;
		this.periodical_title = periodical_title;
		this.preface = preface;
		this.articles = articles;
	}

	public Periodical() {
		super();
	}

	public String getPeriodical_id() {
		return periodical_id;
	}

	public String getCover_path() {
		return cover_path;
	}

	public String getCover_name() {
		return cover_name;
	}

	public String getPeriodical_title() {
		return periodical_title;
	}

	public String getPreface() {
		return preface;
	}


	public List<Article> getArticles() {
		return articles;
	}

	public void setPeriodical_id(String periodical_id) {
		this.periodical_id = periodical_id;
	}

	public void setCover_path(String cover_path) {
		this.cover_path = cover_path;
	}

	public void setCover_name(String cover_name) {
		this.cover_name = cover_name;
	}

	public void setPeriodical_title(String periodical_title) {
		this.periodical_title = periodical_title;
	}

	public void setPreface(String preface) {
		this.preface = preface;
	}

	

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}

	@Override
	public String toString() {
		return "Periodical [periodical_id=" + periodical_id + ", cover_path=" + cover_path + ", cover_name="
				+ cover_name + ", periodical_title=" + periodical_title + ", preface=" + preface
				+ ", articles=" + articles + "]\n";
	}
	
	
}
