package pl.coderslab.ycook.service;

import pl.coderslab.ycook.entity.User;
import pl.coderslab.ycook.entity.UserDetails;

public interface UserDetailsService {

    void save(UserDetails userDetails);

    void update(UserDetails userDetails, long id, String about, String favouriteKitchen, String contact);

    UserDetails findById(long id);

    UserDetails findByUser(User user);
}
