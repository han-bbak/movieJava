package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) {
		// 원본 파일 이름
		String name = originFile.getName();
		
		// 원본 파일 이름에서 . 위치 찾고, . 이후 확장자명 ext변수에 담기
		String ext = "";
		int dot = name.lastIndexOf(".");
		if(dot != -1) {
			ext = name.substring(dot);
		}
		
		// 날짜 포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		// 저장될 이름명
		String fileName = "Store_" + sdf.format(new Date()) + (int)(Math.random() * 10000) + ext;
		
		// 새 이름으로 파일 생성
		File newFile = new File(originFile.getParent(), fileName);
		
		return newFile;
	}

}
