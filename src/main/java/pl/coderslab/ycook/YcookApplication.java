package pl.coderslab.ycook;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import pl.coderslab.ycook.config.StorageProperties;

@SpringBootApplication
@EnableConfigurationProperties(StorageProperties.class)
public class YcookApplication {
    public static void main(String[] args) {
        SpringApplication.run(YcookApplication.class, args);
    }
}
