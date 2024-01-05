package com.mindark.onlinemall.controller;


import com.mindark.onlinemall.result.Result;
import com.mindark.onlinemall.txYun.TxYunStorageService;
import com.mindark.onlinemall.util.UUIDUtil;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/v1/files")
public class UploadFileController {

    @Resource
    private TxYunStorageService txYunStorageService;

    @PostMapping("/upload/tx")
    public Result<String>  upLoadFileByTx(@RequestParam("file")MultipartFile file){
        String fileName = file.getOriginalFilename();
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        fileName = UUIDUtil.uuid() + suffixName;
        String imageUrl = txYunStorageService.uploadFile(file,fileName);
        return Result.success(imageUrl);
    }
    /**
     *  upload cover
     */

    @PostMapping("/upload/cover")
    public Result<String>  upLoadCoverByTx(@RequestParam("file")MultipartFile file){
        String fileName = file.getOriginalFilename();
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        fileName = UUIDUtil.uuid() + suffixName;
        String imageUrl = txYunStorageService.uploadCover(file,fileName);
        return Result.success(imageUrl);
    }


    @DeleteMapping("/delete/tx/{fileName}")
    public Result<Boolean> deleteFileByTx(@PathVariable String fileName){
        txYunStorageService.deleteFile(fileName);
        return Result.success(true);
    }

}
