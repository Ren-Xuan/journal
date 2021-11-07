package renxuan.journal_dao.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import renxuan.journal_dao.entity.User;

@Repository("UserDao")
public interface UserDao {
	void insert(User user);
	void update(User user);
	void delete(User user);
	void deleteById(String id);
	List<User> selectAll();
	
	List<String>selectPasswordById(String id);
	List<String>selectPasswordByTel(String tel);
	List<User> selectById(String id);
	List<User> selectByTel(String tel);
	List<User> selectByName(String name);
	List<User> selectByDepartment(String department);
	List<User> selectByGrade(int grade);
	List<User> selectByGradeBelow(int highestGreade);
	List<User> selectByChecked(int checked);
	void updatePassword(@Param("user_id")String user_id,@Param("old_password")String old_password,@Param("new_password")String new_password);
	
	List<User> selectByMap(Map<String,Object> map);
}
