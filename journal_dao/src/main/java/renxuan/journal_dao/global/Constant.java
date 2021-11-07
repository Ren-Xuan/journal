package renxuan.journal_dao.global;

import java.util.HashMap;
import java.util.Map;

import javax.management.Attribute;
import javax.print.attribute.AttributeSet;
import javax.print.attribute.HashAttributeSet;

public class Constant {
	public static final String FILESYSTEM_OF_IMG="http://localhost:8080/fileSystem/img/";
	public static final String FILESYSTEM_OF_FILE="http://localhost:8080/fileSystem/file/";
	public static final String FILE_REAL_PATH_OF_IMG="D:/apache-tomcat-fileSystem/img";
	public static final String FILE_REAL_PATH_OF_FILE="D:/apache-tomcat-fileSystem/file";
//	public static final String FILESYSTEM_OF_IMG="http://111.229.70.204/fileSystem/img/";
//	public static final String FILESYSTEM_OF_FILE="http://111.229.70.204/fileSystem/file/";
//	public static final String FILE_REAL_PATH_OF_IMG="C:/apache-tomcat-fileSystem/img";
//	public static final String FILE_REAL_PATH_OF_FILE="C:/apache-tomcat-fileSystem/file";
	public Integer ARTICLE_STAGE_;
	
	
	public static final String SUCCESS_INF="success";
	
	public static final Integer RECOMMEND_NUM=5;
	public static final Integer USER_GRADE_OF_LOWEST=1;
	public static final Integer USER_UNCHECKED_STATE=-1;
	public static final Integer USER_WAITCHECKED_STATE=0;
	public static final Integer USER_PASSCHECKED_STATE=1;
	
	public static final Integer USER_MANAGER_GRADE=2;//用户等级权限
	public static final Integer USER_MANAGER_HIGHER_GRADE=3;//用户等级权限
	public static final Integer ARTICLE_STAGE_WAITING=0;
	public static final Integer ARTICLE_STAGE_REJECT=-1;
	public static final Integer ARTICLE_PASSED_STAGE=2;
	//某期刊文章特定设置为首页热门
	public static final String ARTICLE_RECOMMEND_PERIODICAL_ID="00001";
	public static final Integer ARTICLE_RECOMMEND_STAGE=2;
	
	public static final String downloadURL="D:\\\\workspaceExpert\\\\journal\\\\journal_web\\\\src\\\\main\\\\webapp\\\\WEB-INF\\\\download\\\\";
	
	
	public static final String columnNameOfArticle="file";
	public static final String columnNameOfArticleName="file_name";
	
	public static final String columnLabelOfArticle="file";
	public static final String columnLabelOfArticleName="file_name";
	
	public static final String columnNameOfFile="file";
	public static final String columnNameOfFileName="file_name";
	
	public static final String columnLabelOfFile="file";
	public static final String columnLabelOfFileName="file_name";
	
	
	
	public static final String columnNameOfPeriodical="cover";
	public static final String columnNameOfPeriodicalName="cover_name";
	
	public static final String columnLabelOfPeriodical="cover";
	public static final String columnLabelOfPeriodicalName="cover_name";
	
	public static final String columnNameOfCover="cover";
	public static final String columnNameOfCoverName="cover_name";
	
	public static final String columnLabelOfCover="cover";
	public static final String columnLabelOfCoverName="cover_name";
	
	public static final int columnIndexOfArticle=8;
	public static final int columnIndexOfArticleName=9;
	
	public static final int columnIndexOfPeriodical=3;
	public static final int columnIndexOfPeriodicalName=4;
	
	public static final int columnIndexOfFile=8;
	public static final int columnIndexOfFileName=9;
	
	public static final int columnIndexOfCover=3;
	public static final int columnIndexOfCoverName=4;
	private Map<Object, Object> fileToFileNameMap=new HashMap<>();
	public Constant() {
		fileToFileNameMap.put(columnNameOfArticle, columnNameOfArticleName);
		fileToFileNameMap.put(columnLabelOfArticle, columnLabelOfArticleName);
		fileToFileNameMap.put(columnNameOfFile, columnNameOfFileName);
		fileToFileNameMap.put(columnLabelOfFile, columnLabelOfFileName);
		
		
		fileToFileNameMap.put(columnNameOfPeriodical, columnNameOfPeriodicalName);
		fileToFileNameMap.put(columnLabelOfPeriodical, columnLabelOfPeriodicalName);
		fileToFileNameMap.put(columnNameOfCover, columnNameOfCoverName);
		fileToFileNameMap.put(columnLabelOfCover,columnLabelOfCoverName);
		
		fileToFileNameMap.put(columnIndexOfArticle, columnIndexOfArticleName);
		fileToFileNameMap.put(columnIndexOfPeriodical, columnIndexOfPeriodicalName);
		fileToFileNameMap.put(columnIndexOfFile, columnIndexOfFileName);
		fileToFileNameMap.put(columnIndexOfCover, columnIndexOfCoverName);
	}
	public Map<Object, Object> getNameMap() {
		return fileToFileNameMap;
	}
	
	
}
