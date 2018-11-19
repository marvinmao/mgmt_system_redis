package com.llnqdx.cms.base.modules.sys.service;

import com.llnqdx.cms.base.modules.sys.dao.LogDao;
import com.llnqdx.cms.base.modules.sys.entity.Log;
import com.llnqdx.cms.common.persistence.Page;
import com.llnqdx.cms.common.service.CrudService;
import com.llnqdx.cms.common.utils.DateUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 日志Service
 *
 * @author Idea
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class LogService extends CrudService<LogDao, Log> {

    public Page<Log> findPage(Page<Log> page, Log log) {

        // 设置默认时间范围，默认当前月
        if (log.getBeginDate() == null) {
            log.setBeginDate(DateUtils.setDays(DateUtils.parseDate(DateUtils.getDate()), 1));
        }
        if (log.getEndDate() == null) {
            log.setEndDate(DateUtils.addMonths(log.getBeginDate(), 1));
        }

        return super.findPage(page, log);

    }

}
