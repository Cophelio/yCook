package pl.coderslab.ycook.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.ycook.entity.Recipe;

@Repository
public interface RecipeRepository extends JpaRepository<Recipe, Long> {
    Recipe findById(int id);
}
