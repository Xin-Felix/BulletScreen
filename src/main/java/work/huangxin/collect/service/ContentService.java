package work.huangxin.collect.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import work.huangxin.collect.mapper.ContentMapper;
import work.huangxin.collect.model.Content;
import work.huangxin.collect.util.SameService;

import java.util.List;
@Service
public class ContentService extends SameService<Content> {

    @Autowired
    private ContentMapper contentMapper;

    public List<Content> getNewData() {
        return contentMapper.getNewData();
    }

    public List<Content> getData(Integer id) {

        return contentMapper.getData(id);
    }
}
