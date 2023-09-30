package utils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.apache.catalina.filters.ExpiresFilter.XHttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

public class XForm {
	public static boolean exist(String name) {
		return RRSharer.request().getParameter(name) != null;
	}

	public static String getString(String name, String defval) {
		String value = RRSharer.request().getParameter(name);
		return value == null ? defval : value;
	}

	public static int getInt(String name, int defval) {
		String value = getString(name, String.valueOf(defval));
		return Integer.parseInt(value);
	}

	public static double getDouble(String name, double defval) {
		String value = getString(name, String.valueOf(defval));
		return Double.parseDouble(value);
	}

	public static boolean getBoolean(String name, boolean defval) {
		String value = getString(name, String.valueOf(defval));
		return Boolean.parseBoolean(value);
	}

	public static Date getDate(String name, Date defval) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		String date = getString(name, sdf.format(defval));
		try {
			return sdf.parse(date);
		} catch (Exception e) {
			return defval;
		}
	}

	public static File save(String name, String path) {
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		try {
			Part part = RRSharer.request().getPart(name);
			if (part != null && part.getSize() > 0) {
				String fn = System.currentTimeMillis() + part.getName();
				String filename = Integer.toHexString(fn.hashCode()) + fn.substring(fn.lastIndexOf("."));
				File file = new File(dir, filename);
				part.write(file.getAbsolutePath());
				return file;
			}
			return null;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@SuppressWarnings("deprecation")
	public static <T> T getBean(Class<T> clazz) {
		DateTimeConverter dtc = new DateConverter(new Date());
		dtc.setPattern("MM/dd/yyyy");
		ConvertUtils.register(dtc, Date.class);
		try {
			T bean = clazz.newInstance();
			BeanUtils.populate(bean, RRSharer.request().getParameterMap());
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
