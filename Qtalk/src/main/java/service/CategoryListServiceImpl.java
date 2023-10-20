package service;

import java.util.List;

import dao.CategoryListDao;
import dao.CategoryListDaoImpl;
import dto.ExamInfo;
import dto.ExamSchedule;

public class CategoryListServiceImpl implements CategoryListService {
	private CategoryListDao categoryListDao;

	public CategoryListServiceImpl() {
		categoryListDao = new CategoryListDaoImpl();
	}

	@Override
	public List<ExamInfo> getAllCategoryList() throws Exception {
		return categoryListDao.selectAllCategory();
	}

	@Override
	public List<ExamInfo> getFirstCategoryList() throws Exception {
		return categoryListDao.selectFirstCategory();
	}

	@Override
	public List<ExamInfo> getSecoundCategoryList() throws Exception {
		return categoryListDao.selectSecondCategory();
	}

	@Override
	public List<String> getMdtoOd(String firstValue) throws Exception {
		return categoryListDao.selectMdtoOd(firstValue);
	}

	@Override
	public List<String> getOdtoJm(String secondValue) throws Exception {
		return categoryListDao.selectOdtoJm(secondValue);
	}

	@Override
	public List<ExamSchedule> getJm(String thirdValue) throws Exception {
		return categoryListDao.selectJm(thirdValue);
	}	
}
