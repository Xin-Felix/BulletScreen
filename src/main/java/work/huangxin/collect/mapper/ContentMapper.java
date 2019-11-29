package work.huangxin.collect.mapper;

import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;
import work.huangxin.collect.model.Content;

import java.util.List;

@org.apache.ibatis.annotations.Mapper
public interface ContentMapper extends Mapper<Content> {
    List<Content> getData(@Param("id") Integer id);


    List<Content> getNewData();
}