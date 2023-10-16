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
	public List<ExamInfo> getCategoryList() throws Exception {
		return categoryListDao.selectCategory();
	}

}
