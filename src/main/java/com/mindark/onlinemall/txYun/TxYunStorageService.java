package com.mindark.onlinemall.txYun;

import com.mindark.onlinemall.exception.GlobalException;
import com.mindark.onlinemall.result.CodeMsg;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.model.PutObjectRequest;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Service
@Slf4j
public class TxYunStorageService {
    @Value("${tengxun.bucket.name}")
    private String bucketName;
    @Value("${tengxun.bucket.name.folder}")
    private String folder;
    @Value("${tengxun.host}")
    private String host;
    @Value("${tengxun.bucket.name.cover}")
    private String cover;

    @Resource
    private COSClient cosClient;


    public String uploadFile(MultipartFile file,String fileName) {
        File fileObj = convertMultiPartFileToFile(file);
//      String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        cosClient.putObject(new PutObjectRequest(bucketName, folder+fileName, fileObj));
        fileObj.delete();
        return new StringBuilder().append(host).append(folder).append(fileName).toString();
    }

    public String uploadCover(MultipartFile file,String fileName) {
        File fileObj = convertMultiPartFileToFile(file);
        cosClient.putObject(new PutObjectRequest(bucketName, cover+fileName, fileObj));
        fileObj.delete();
        return new StringBuilder().append(host).append(cover).append(fileName).toString();
    }

    public void deleteFile(String fileName){
        String key = folder + fileName;
        cosClient.deleteObject(bucketName, key);
    }

    private File convertMultiPartFileToFile(MultipartFile file) {
        File convertedFile = new File(file.getOriginalFilename());
        try (FileOutputStream fos = new FileOutputStream(convertedFile)) {
            fos.write(file.getBytes());
        } catch (IOException e) {
            log.error("Error converting multipartFile to file", e);
            throw new GlobalException(CodeMsg.IMG_UPLOAD_ERROR);
        }
        return convertedFile;
    }

}
