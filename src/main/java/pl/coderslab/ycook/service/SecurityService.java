package pl.coderslab.ycook.service;

public interface SecurityService {
    String findLoggedInUsername();

    void autoLogin(String username, String password);
}