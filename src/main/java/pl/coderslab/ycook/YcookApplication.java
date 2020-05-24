package pl.coderslab.ycook;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.File;

@SpringBootApplication
public class YcookApplication {
    public static void main(String[] args) {
//        new File(ImageController.uploadDirectory).mkdir();
        SpringApplication.run(YcookApplication.class, args);
    }
}
