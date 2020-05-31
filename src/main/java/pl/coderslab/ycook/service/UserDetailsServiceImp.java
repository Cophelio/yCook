package pl.coderslab.ycook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.ycook.entity.User;
import pl.coderslab.ycook.entity.UserDetails;
import pl.coderslab.ycook.repository.UserDetailsRepository;

@Service
public class UserDetailsServiceImp implements UserDetailsService {

    @Autowired
    private UserDetailsRepository userDetailsRepository;

    @Override
    public void save(UserDetails userDetails) {
        userDetailsRepository.save(userDetails);
    }

    @Override
    public void update(UserDetails userDetails, long id, String about, String favoriteKitchen, String contact) {
        UserDetails foundedUser = userDetailsRepository.findById(id);
        foundedUser.setAbout(about);
        foundedUser.setFavouriteKitchen(favoriteKitchen);
        foundedUser.setContact(contact);
        userDetailsRepository.save(userDetails);
    }

    @Override
    public UserDetails findById(long id) {
        return userDetailsRepository.findById(id);
    }

    @Override
    public UserDetails findByUser(User user) {
        return userDetailsRepository.findByUser(user);
    }
}
