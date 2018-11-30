package com.incon.common.pdf.app.pdf;

 

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.xhtmlrenderer.pdf.ITextFontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;


import com.incon.common.pdf.app.freemaker.HtmlGenerator;
import com.incon.common.pdf.app.pdf.factory.ITextRendererObjectFactory;
import com.incon.common.pdf.app.utils.ResourceLoader;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.BaseFont;

import freemarker.template.TemplateException;

/**
 * pdf 生成
 * 
 * @ClassName: PdfGenerator
 * @Description:pdf 生成
 * @author lihengjun 修改时间： 2013年11月5日 下午3:27:22 修改内容：新建
 */
public class PdfDocumentGenerator {
	private final static Logger logger = Logger.getLogger(PdfDocumentGenerator.class);

	private final static HtmlGenerator htmlGenerator;
	
	static {
		htmlGenerator = new HtmlGenerator();
	}
 
	/**
	 * 使用模板,模板数据,生成pdf
	 * 
	 * @Title: generate
	 * @Description: 使用模板,模板数据,生成pdf
	 * @param template
	 *            classpath中路径模板路径
	 * @param documentVo
	 *            模板数据
	 * @param outputFile
	 *            生成pdf的路径
	 * @author lihengjun 修改时间： 2013年11月5日 下午1:38:53 修改内容：新建
	 * @throws DocumentGeneratingException
	 */
	public boolean generate(String template, DocumentVo documentVo, String outputFile)   {
		    Map<String, Object> variables = new HashMap<String, Object>();
			variables = documentVo.fillDataMap();
			String htmlContent;
			try {
				htmlContent = this.htmlGenerator.generate(template,variables);
				this.generate(htmlContent, outputFile);
			} catch (IOException e) {
				e.printStackTrace();
			} catch (TemplateException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		return true;
	}
	
	public boolean generate(String template, DocumentVo documentVo, HttpServletResponse response)   {
	    Map<String, Object> variables = new HashMap<String, Object>();
		variables = documentVo.fillDataMap();
		String htmlContent;
		try {
			htmlContent = this.htmlGenerator.generate(template,variables);
			this.generate(htmlContent, response);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	return true;
}
	public boolean generate(String template,  Map<String, Object> documentVo, HttpServletResponse response)   {
	    Map<String, Object> variables = new HashMap<String, Object>();
		variables = documentVo ;
		String htmlContent;
		try {
			htmlContent = this.htmlGenerator.generate(template,variables);
			this.generate(htmlContent, response);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	return true;
}
	/**
	 * Output a pdf to the specified outputstream
	 * 
	 * @param htmlContent
	 *            the htmlstr
	 * @param out
	 *            the specified outputstream
	 * @throws Exception
	 */
	public void generate(String htmlContent, String outputFile)
			throws Exception {
		OutputStream out = null;
		ITextRenderer iTextRenderer = null;

		try {
			DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
			Document doc = builder.parse(new ByteArrayInputStream(htmlContent.getBytes("UTF-8")));
			out = new FileOutputStream(outputFile);
			iTextRenderer = (ITextRenderer) ITextRendererObjectFactory.getObjectPool().borrowObject();//获取对象池中对象
			try {
				iTextRenderer.setDocument(doc, null);
				iTextRenderer.layout();
				iTextRenderer.createPDF(out);
				 
				
			} catch (Exception e) {
				ITextRendererObjectFactory.getObjectPool().invalidateObject(iTextRenderer);
				iTextRenderer = null;
				throw e;
			}

		} catch (Exception e) {
			throw e;
		} finally {
			if (out != null)
				out.close();
			if (iTextRenderer != null) {
				try {
					ITextRendererObjectFactory.getObjectPool().returnObject(
							iTextRenderer);
				} catch (Exception ex) {
					logger.error("Cannot return object from pool.", ex);
				}
			}
		}
	}
	public void generate(String htmlContent, HttpServletResponse response)  {
		ServletOutputStream out = null;
		ITextRenderer iTextRenderer = null;

		try {
			DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
			//System.out.println(htmlContent);
			//System.out.println(htmlContent.getBytes("UTF-8"));
			Document doc = builder.parse(new ByteArrayInputStream(htmlContent.getBytes("UTF-8")));
			out = response.getOutputStream();
//			iTextRenderer = (ITextRenderer) ITextRendererObjectFactory.getObjectPool().borrowObject();//获取对象池中对象
			   iTextRenderer = new  ITextRenderer();
			   addFonts(iTextRenderer.getFontResolver());
		 
				iTextRenderer.setDocument(doc, null);
				iTextRenderer.layout();
				iTextRenderer.createPDF(out);
				
			    out.flush(); 
				out.close();
			 
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				out.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	/**
	 * 添加字体
	 * 
	 * @Title: addFonts
	 * @Description:
	 * @param fontResolver
	 * @throws DocumentException
	 * @throws IOException
	 * @author lihengjun 修改时间： 2013年11月5日 下午1:37:57 修改内容：新建
	 */
	public static ITextFontResolver addFonts(ITextFontResolver fontResolver)
			throws DocumentException, IOException {
		// Font fontChinese = null;
		// BaseFont bfChinese = BaseFont.createFont("STSong-Light",
		// "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
		// fontChinese = new Font(bfChinese, 12, Font.NORMAL);

		File fontsDir = new File(ResourceLoader.getPath("freemaker/fonts"));
		if (fontsDir != null && fontsDir.isDirectory()) {
			File[] files = fontsDir.listFiles();
			for (int i = 0; i < files.length; i++) {
				File f = files[i];
				if (f == null || f.isDirectory()) {
					break;
				}
			 
				fontResolver.addFont(f.getAbsolutePath(), BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED);
			}
		}
		return fontResolver;
	}
}