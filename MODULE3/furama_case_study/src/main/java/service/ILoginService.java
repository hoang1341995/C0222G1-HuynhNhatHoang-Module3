package service;

import java.util.Map;

public interface ILoginService {

    Map<String,String> checkAccount(String username, String password);
}
