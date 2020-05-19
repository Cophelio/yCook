package pl.coderslab.ycook.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import pl.coderslab.ycook.entity.Recipe;

@Component
public class RecipeValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Recipe.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Recipe recipe = (Recipe) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty");
        if (recipe.getName().length() < 6) {
            errors.rejectValue("name", "Size.recipeForm.name");
        }
        if (recipe.getName().length() > 60) {
            errors.rejectValue("name", "ToMuch");
        }

//
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
//        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
//            errors.rejectValue("password", "Size.userForm.password");
//        }
//
//        if (!user.getPasswordConfirm().equals(user.getPassword())) {
//            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
//        }
    }
}
