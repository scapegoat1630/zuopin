/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.byau.util;

/**
 *
 * @author Administrator
 */
import com.oreilly.servlet.multipart.FileRenamePolicy;
import java.io.File;
import java.util.Date;
public class RandomFileRenamePolicy implements
        FileRenamePolicy {
    public File rename(File file) {
        String body="";
        String ext="";
        int pot=file.getName().lastIndexOf(".");
            body=(new Date()).getTime()+"";
            ext=file.getName().substring(pot);
        String newName=body+ext;
        file=new File(file.getParent(),newName);
        return file;
    }
}
