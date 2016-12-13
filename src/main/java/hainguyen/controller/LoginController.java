package hainguyen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by jinz on 12/12/16.
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {
    @RequestMapping(method = RequestMethod.GET)
    public String login(Model model,String error, String logout){
        if (error != null)
            model.addAttribute("message", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");
        return "login";
    }
    @RequestMapping(method = RequestMethod.POST)
    public String handleLogin(Model model){
        return "login";
    };
}
