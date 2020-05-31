package pl.coderslab.ycook.entity;

import javax.persistence.*;

@Entity
@Table(name = "UserDetails")
public class UserDetails {

    @Id
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @MapsId
    private User user;

    private String about;

    private String favouriteKitchen;

    private String contact;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getFavouriteKitchen() {
        return favouriteKitchen;
    }

    public void setFavouriteKitchen(String favouriteKitchen) {
        this.favouriteKitchen = favouriteKitchen;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }
}
