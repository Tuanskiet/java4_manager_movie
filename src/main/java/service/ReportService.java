package service;

import java.util.List;
import contants.NamedStored;
import dao.AbstractDao;
import entity.Report;

public class ReportService extends AbstractDao<Report>{

	public List<Report> getListFavouriteRP() {
		return super.callStored(NamedStored.STATISTICAL_FAVOURITE_BY_VIDEO, null);
	}

}
