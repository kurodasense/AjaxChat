package chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import chat.po.Content;
import chat.po.User;

@Repository("userDao")
public interface UserDao {
	public User login(User user);
	public int regist(User user);
	public List<User> selectAllUsers(); 
	public List<Content> showContent(String chatid);
	public int send(@Param("chatid") String chatid, @Param("username") String username, @Param("content") String content);
	public User findUser(Integer id);
}
