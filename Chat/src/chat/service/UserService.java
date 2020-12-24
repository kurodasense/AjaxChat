package chat.service;

import java.util.List;

import chat.po.Content;
import chat.po.User;

public interface UserService {
	public User login(User user);
	public int regist(User user);
	public List<User> selectAllUsers(); 
	public List<Content> showContent(String chatid);
	public int send(String chatid, String username, String content);
	public User findUser(Integer id);
}
