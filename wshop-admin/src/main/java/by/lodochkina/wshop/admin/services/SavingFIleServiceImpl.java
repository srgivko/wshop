package by.lodochkina.wshop.admin.services;

import by.lodochkina.wshop.entities.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class SavingFIleServiceImpl implements SavingFileService {

    @Value("${upload.path}")
    private String uploadPath;


    @Override
    public String saveFile(MultipartFile file) throws IOException, IllegalAccessException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadDir + "/" + resultFileName));
            return resultFileName;
        }
        return null;
    }
}
