package web.util;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUpload {
	public static Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		
		//디렉토리경로 지정
		String savePath = "D:\\TeamProjectFile\\teamProject_Spring\\moment_web\\src\\main\\webapp\\resources\\uploadFile";
		
		//Map형식의 String 키값, String 벨류값으로 지정
		Map<String, String> fileUploadMap = new HashMap<>();
		String encoding = "UTF-8";
		
		//현재 저장소를 File 객체를 생성해 지정해줌.
		File currentDirPath = new File(savePath);
		
		//업로드된 파일을 저장할 저장소와 관련된 클래스.
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		//메서드는 업로드 된 파일을 저장할 위치를 File객체로 지정.
		factory.setRepository(currentDirPath);
		
		//HTTP 요청에 대한 HttpServletRequest 객체로부터 multipart/form-data형식으로 넘어온 HTTP Body 부분을 다루기 쉽게 변환(parse)해주는 역할을 수행.  
		//parseRequest()메서드를 수행하면 FileItem이라는 형식으로 변환.
		ServletFileUpload upload = new ServletFileUpload(factory);
	
		try {
			List<FileItem> items = upload.parseRequest(request);
			
			for (int i = 0; i < items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);
				if(fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName()+" = "+fileItem.getString(encoding));
					fileUploadMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
				}else {
					if(fileItem.getSize() > 0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						
						if(idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
						String fileName = fileItem.getName().substring(idx + 1);
						fileUploadMap.put(fileItem.getFieldName(), fileName);
						//파일 만들기
						File uploadFile = new File(currentDirPath + "\\" + fileName);
						fileItem.write(uploadFile);
					}
				}
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return fileUploadMap;
	}
	
	//이미지 합성
	public static void imageMerge(String imagePath, String imageName1, String imageName2) {
		try {
			BufferedImage bimage1 = ImageIO.read(new File(imagePath+"\\"+imageName1));
			BufferedImage bimage2 = ImageIO.read(new File(imagePath+"\\"+imageName2));
		   
//			Image img1 = bimage1.getScaledInstance(bimage1.getWidth(), bimage1.getHeight(), Image.SCALE_SMOOTH);
//			Image img2 = bimage2.getScaledInstance(bimage2.getWidth(), bimage2.getHeight(), Image.SCALE_SMOOTH);
			
			int width = bimage1.getWidth()+ bimage2.getWidth();
			int height = Math.max(bimage1.getHeight() , bimage2.getHeight());

			BufferedImage mergedImage = new BufferedImage(width-100, height+1000, BufferedImage.TYPE_INT_RGB);
			Graphics2D graphics = (Graphics2D) mergedImage.getGraphics();

			graphics.setBackground(Color.WHITE);
			graphics.drawImage(image_crop(bimage1, imagePath, imageName1), 0, 500, null);
			graphics.drawImage(bimage2, bimage1.getWidth()-100, 500, null);
			graphics.dispose();
		   
			ImageIO.write(mergedImage, "jpg", new File(imagePath+"\\"+imageName1.replace("_1.jpg", "_rev.jpg")));
			// ImageIO.write(mergedImage, "jpg", new File("c:\\mergedImage.jpg"));
			// ImageIO.write(mergedImage, "png", new File("c:\\mergedImage.png"));
		  } catch (IOException ioe) {
			ioe.printStackTrace();
		  }
		
		  	System.out.println("이미지 합성 완료");
	}
	
	//이미지 끝 부분 투명도 조정
	private static BufferedImage image_crop(BufferedImage img, String imagePath, String imageName1) throws IOException {
		int width = img.getWidth();
		int height = img.getHeight();
		float opacity = 0.7f;
		
		//원본 이미지 100만큼 자르기
		BufferedImage image = new BufferedImage(width-100, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D cropImage = (Graphics2D) image.getGraphics();
		cropImage.drawImage(img, 0, 0, null);
		cropImage.dispose();
		
		//이미지 투명도 조절
		BufferedImage cropSize_opacity = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
		Graphics2D opacityImage = (Graphics2D) cropSize_opacity.getGraphics();
		opacityImage.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, opacity));
		opacityImage.drawImage(img, 0, 0, null);
		opacityImage.dispose();
		ImageIO.write(cropSize_opacity, "png", new File(imagePath+"\\"+imageName1.replace("_1.jpg", "_opa.png")));
		
		//두 이미지 합치기
		BufferedImage result = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
		Graphics2D resultImage = (Graphics2D) result.getGraphics();
		resultImage.drawImage(image, 0, 0, null);
		resultImage.drawImage(cropSize_opacity, 0, 0, null);
		resultImage.dispose();
		
		return result;
		
	}
		
}
