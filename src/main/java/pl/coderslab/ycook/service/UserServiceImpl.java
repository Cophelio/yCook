package pl.coderslab.ycook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.coderslab.ycook.entity.User;
import pl.coderslab.ycook.entity.UserDetails;
import pl.coderslab.ycook.repository.RoleRepository;
import pl.coderslab.ycook.repository.UserDetailsRepository;
import pl.coderslab.ycook.repository.UserRepository;

import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private final UserRepository userRepository;

    @Autowired
    private final RoleRepository roleRepository;

    @Autowired
    private final BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private final UserDetailsRepository userDetailsRepository;

    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository,
                           BCryptPasswordEncoder passwordEncoder, UserDetailsRepository userDetailsRepository) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.userDetailsRepository = userDetailsRepository;
    }

    @Override
    public void save(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        user.setRoles(new HashSet<>(roleRepository.findAll()));
        userRepository.save(user);
    }

//    @Override
//    public void saveDetails(User user, UserDetails userDetails) {
//        Long id = user.getId();
//        userDetails.setId(id);
//        userDetailsRepository.save(userDetails);
//    }

    @Override
    public void changePassword(User user, String password) {
        user.setPassword(password);
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User findById(long id) {
        return userRepository.findById(id);
    }
}
