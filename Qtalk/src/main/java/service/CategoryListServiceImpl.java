package service;

import java.util.List;

import dao.CategoryListDao;
import dao.CategoryListDaoImpl;
import dto.ExamInfo;

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
	
}
