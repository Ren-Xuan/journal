package renxuan.journal_web.global;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import renxuan.journal_dao.global.Constant;

public class UploadUtil {
	public static Map<String, String> fileUpload( MultipartFile file,HttpServletRequest req){
		// 获取要上传的目标位置，即是项目的upload文件夹所在的绝对路径
		//如果添加了tomcat的虚拟映射路径，需要先新建一个upload文件夹
		//String path = req.getSession().getServletContext().getRealPath("/");
		String path=Constant.FILESYSTEM_OF_FILE;
		String realPath=Constant.FILE_REAL_PATH_OF_FILE;
		System.out.println(path);
		// 获取文件的扩展名
        String ext = FilenameUtils.getExtension(file.getOriginalFilename());
		String filename =UUID.randomUUID().toString().substring(1, 20).replaceAll("-", "")+"."+ ext;
		// 写入文件成功之后，返回的数据，也就是数据库里要存的文件的url
		
		
		File targetFile= new File(realPath,filename);
		try {
			if(!targetFile.exists()){
				//写入文件
				file.transferTo(targetFile);
			}
			Map<String, String>map=new HashMap<String, String>();
			map.put("path", path);
			map.put("name", filename);
			System.out.println(filename);
			return map;
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//写入文件失败，则返回空字符串
		return null;
	}
	public static Map<String, String> imageUpload( MultipartFile file,HttpServletRequest req){
		// 获取要上传的目标位置，即是项目的upload文件夹所在的绝对路径
		//如果添加了tomcat的虚拟映射路径，需要先新建一个upload文件夹
		//String path = req.getSession().getServletContext().getRealPath("img");
		String path=Constant.FILESYSTEM_OF_IMG;
		String realPath=Constant.FILE_REAL_PATH_OF_IMG;
		System.out.println(path);
		// 获取文件的扩展名
        String ext = FilenameUtils.getExtension(file.getOriginalFilename());
        String filename =UUID.randomUUID().toString().substring(1, 20).replaceAll("-", "")+"."+ ext;
		// 写入文件成功之后，返回的数据，也就是数据库里要存的文件的url
		String src="img/";
		System.out.println(src);
		File targetFile= new File(realPath,filename);
		try {
			if(!targetFile.exists()){
				//写入文件
				file.transferTo(targetFile);
			}
			Map<String, String>map=new HashMap<String, String>();
			map.put("path", path);
			map.put("name", filename);
			return map;
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//写入文件失败，则返回空字符串
		return null;
	}
}
