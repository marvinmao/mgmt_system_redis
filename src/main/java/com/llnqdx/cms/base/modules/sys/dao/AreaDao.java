package com.llnqdx.cms.base.modules.sys.dao;

import com.llnqdx.cms.base.modules.sys.entity.Area;
import com.llnqdx.cms.common.persistence.TreeDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 区域DAO接口
 *
 * @author Idea
 * @version 2014-05-16
 */
@Mapper
public interface AreaDao extends TreeDao<Area> {

}
