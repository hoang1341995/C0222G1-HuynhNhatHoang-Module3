package service.impl;

import repository.ILoginRepo;
import repository.impl.LoginRepo;
import service.ILoginService;

import java.util.HashMap;
import java.util.Map;

public class LoginService implements ILoginService {
        ILoginRepo loginRepo = new LoginRepo();
    @Override
    public Map<String,String> checkAccount(String username, String password) {

        Map<String, String> mapRegexLogin = new HashMap<>();
        return  null;


    }
}
