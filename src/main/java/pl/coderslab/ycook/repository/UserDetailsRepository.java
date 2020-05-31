package pl.coderslab.ycook.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.ycook.entity.UserDetails;

public interface UserDetailsRepository extends JpaRepository<UserDetails, Long> {
    UserDetails findById(long id);
}
