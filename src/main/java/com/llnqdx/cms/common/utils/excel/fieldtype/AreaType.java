package com.llnqdx.cms.common.utils.excel.fieldtype;

import com.llnqdx.cms.base.modules.sys.entity.Area;
import com.llnqdx.cms.base.modules.sys.utils.UserUtils;
import com.llnqdx.cms.common.utils.StringUtils;

/**
 * 字段类型转换
 *
 * @author Idea
 * @version 2013-03-10
 */
public class AreaType {

    /**
     * 获取对象值（导入）
     */
    public static Object getValue(String val) {
        for (Area e : UserUtils.getAreaList()) {
            if (StringUtils.trimToEmpty(val).equals(e.getName())) {
                return e;
            }
        }
        return null;
    }

    /**
     * 获取对象值（导出）
     */
    public static String setValue(Object val) {
        if (val != null && ((Area) val).getName() != null) {
            return ((Area) val).getName();
        }
        return "";
    }
}
