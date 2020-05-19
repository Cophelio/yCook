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

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cuisine", "NotEmpty");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "type", "NotEmpty");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ingredients", "NotEmpty");
        if (recipe.getIngredients().length() < 3) {
            errors.rejectValue("ingredients", "Size.recipeForm.ingredients");
        }
        if (recipe.getIngredients().length() > 300) {
            errors.rejectValue("ingredients", "Size.recipeForm.toMuch.ingredients");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "NotEmpty");
        if (recipe.getDescription().length() < 6) {
            errors.rejectValue("description", "Size.recipeForm.name");
        }
        if (recipe.getDescription().length() > 1200) {
            errors.rejectValue("description", "Size.recipeForm.toMuch.description");
        }

        if (recipe.getOther().length() > 60) {
            errors.rejectValue("other", "ToMuch");
        }

        if (recipe.getTime().length() > 30) {
            errors.rejectValue("time", "Size.recipeForm.time");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "level", "NotEmpty");
    }
}
