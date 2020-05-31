package pl.coderslab.ycook.service;

import pl.coderslab.ycook.entity.User;
import pl.coderslab.ycook.entity.UserDetails;

public interface UserService {
    void save(User user);

//    void saveDetails(User user, UserDetails userDetails);

    void changePassword(User user, String password);

    User findByUsername(String username);

    User findById(long id);
}
