package pl.coderslab.ycook.service;

import pl.coderslab.ycook.entity.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
