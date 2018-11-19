package com.llnqdx.cms.base.modules.sys.dao;

import com.llnqdx.cms.base.modules.sys.entity.Office;
import com.llnqdx.cms.common.persistence.TreeDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 机构DAO接口
 *
 * @author Idea
 * @version 2014-05-16
 */
@Mapper
public interface OfficeDao extends TreeDao<Office> {

}
