package chat.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;

import chat.po.Content;
import chat.po.User;
import chat.service.UserService;

@Controller("userController")
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/gotologin")
	public String gotologin() {
		return "login";
	}
	
	@RequestMapping("/gotoregist")
	public String gotoregist() {
		return "regist";
	}
	
	@RequestMapping("/regist")
	public String regist(User user, Model model) {
		int num = userService.regist(user);
		if(num>0) {
			return "redirect:/index.jsp";
		}else {
			model.addAttribute("msg", "×¢²áÊ§°Ü");
			return "regist";
		}
		
	}
	
	@RequestMapping("/login")
	public String login(String chatid, User user, HttpSession session, Model model) {
		User us = userService.login(user);
		List<User> users = userService.selectAllUsers();
		List<Content> cs = userService.showContent(chatid);
		if(us != null) {
			session.setAttribute("user", us);
			model.addAttribute("users", users);
			model.addAttribute("contents", cs);
			return "chat";
		}
		else {
			model.addAttribute("msg", "µÇÂ¼Ê§°Ü");
			return "login";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/send")
	public void send(String chatid, String content, HttpSession session, HttpServletResponse response) throws IOException{
		User user = (User)session.getAttribute("user");
		String username = user.getUsername();
		userService.send(chatid, username, content);
		response.getWriter().print(username+": "+content);
	}
	
	@RequestMapping("/showallcontent")
	@ResponseBody
	public void showallcontent(String chatid, HttpServletResponse response) throws IOException {
		List<Content> cs = userService.showContent(chatid);
		String myul = "";
		for(Content c : cs) {
			myul += "<li>"+c.getUsername()+": "+c.getContent()+"</li>";
		}
		response.getWriter().print(myul);
	}
	
	@RequestMapping("/siliao")
	public String siliao(String chatid, Integer id, Model model) {
		User user = userService.findUser(id);
		List<User> users = userService.selectAllUsers();
		List<Content> cs = userService.showContent(chatid);
		model.addAttribute("contents", cs);
		model.addAttribute("users", users);
		model.addAttribute("anouser", user);
		return "siliao";
	}
	
	@RequestMapping("/showcontent")
	public void showcontent(String chatid, HttpServletResponse response) throws IOException{
		List<Content> cs = userService.showContent(chatid);
		String myul = "";
		for(Content c : cs) {
			myul += "<li>"+c.getUsername()+": "+c.getContent()+"</li>";
		}
		response.getWriter().print(myul);
	}
	
	@RequestMapping("/gotopublicchat")
	public String gotopublicchat(String chatid, Model model) {
		List<User> users = userService.selectAllUsers();
		List<Content> cs = userService.showContent(chatid);
		model.addAttribute("users", users);
		model.addAttribute("contents", cs);
		return "chat";
	}
	
}
