package pl.coderslab.ycook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.coderslab.ycook.entity.Role;
import pl.coderslab.ycook.entity.User;
import pl.coderslab.ycook.repository.RoleRepository;
import pl.coderslab.ycook.repository.UserRepository;

import java.util.Arrays;
import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private final UserRepository userRepository;
    @Autowired
    private final RoleRepository roleRepository;
    @Autowired
    private final BCryptPasswordEncoder passwordEncoder;

    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository,
                           BCryptPasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @Override
    public void save(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        userRepository.save(user);
    }

    @Override
    public User authenticate(User other) {
        User userFromDatabase = findByUsername(other.getUsername());
        if (userFromDatabase == null) {
            return null;
        }

        String encodedPassword = passwordEncoder.encode(other.getPassword());
        if (encodedPassword.equals(userFromDatabase.getPassword())) {
            return userFromDatabase;
        }
        return null;
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
