package renxuan.journal_dao.converter;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLType;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.BlobTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.springframework.beans.factory.annotation.Autowired;

import renxuan.journal_dao.dao.ArticleDao;
import renxuan.journal_dao.global.Constant;


public class FileConverter extends BaseTypeHandler<File>{
	
	@Autowired
	public Constant constant;
	
	
	@Override
	public File getNullableResult(ResultSet rs, String columnName) throws SQLException {
		File file=null;
		try {
		String fileName=rs.getString(constant.getNameMap().get(columnName)+"");
		String url=Constant.downloadURL+fileName;
		
		System.out.println(url);
		file=new File(url);
		if(!file.exists()) {
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			file.delete();
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		try {
			FileOutputStream fos=new FileOutputStream(file);
			BlobTypeHandler blob=new BlobTypeHandler();
			byte [] bytes=blob.getResult(rs, columnName);
		
			fos.write(bytes, 0, bytes.length);
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		}catch (Exception e) {
			return null;
		}
		return file;
	}

	@Override
	public File getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		File file=null;
		try {
		String fileName=rs.getString((int) constant.getNameMap().get(columnIndex));
		String url=Constant.downloadURL+fileName;
		
		System.out.println(url);
		file=new File(url);
		if(!file.exists()) {
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			file.delete();
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		try {
			FileOutputStream fos=new FileOutputStream(file);
			BlobTypeHandler blob=new BlobTypeHandler();
			byte [] bytes=blob.getResult(rs, columnIndex);
		
			fos.write(bytes, 0, bytes.length);
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		}catch (Exception e) {
			return null;
		} 
		return file;
	}

	@Override
	public File getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		File file=null;
		try {
		String fileName=cs.getString((int) constant.getNameMap().get(columnIndex));
		String url=Constant.downloadURL+fileName;
		
		System.out.println(url);
		file=new File(url);
		if(!file.exists()) {
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			file.delete();
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		try {
			FileOutputStream fos=new FileOutputStream(file);
			BlobTypeHandler blob=new BlobTypeHandler();
			byte [] bytes=blob.getResult(cs, columnIndex);
		
			fos.write(bytes, 0, bytes.length);
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		}catch (Exception e) {
			return null;
		}
		return file;
	}

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, File parameter, JdbcType jdbcType)
			throws SQLException {
		byte[]bytes = null;
		try {
		FileInputStream fis;
		
		try {
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			fis = new FileInputStream(parameter);
		    byte[] b = new byte[1024];
	        int n;
	        while ((n = fis.read(b)) != -1) {
			     bos.write(b, 0, n);
			}
	        fis.close();
	        bos.close();
	        bytes = bos.toByteArray();
		}catch (Exception e) {
			System.err.println("setNonNullParameter");
			e.printStackTrace();
		}
		}catch (Exception e) {
			 BlobTypeHandler blob=new BlobTypeHandler();
			ps.setNull(i, 0);;
		}
		 BlobTypeHandler blob=new BlobTypeHandler();
			blob.setParameter(ps, i, bytes, jdbcType);
		
	}


}
