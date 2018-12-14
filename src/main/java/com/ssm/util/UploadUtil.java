package com.ssm.util;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
/**
 * @author: create by TianYc
 * @version: v1.0
 * @description: com.ssm.util
 * @date:2018/12/14
 **/
public class UploadUtil {
    public static  String uploadFile(MultipartFile file,String path,String fileName) throws IOException {
        File tempFile = new File(path,fileName);
        if(!tempFile.getParentFile().exists()){
            tempFile.getParentFile().mkdir();
        }
        if(tempFile.exists()){
            tempFile.delete();
        }
        tempFile.createNewFile();
        file.transferTo(tempFile);
        return tempFile.getName();
     }
}
