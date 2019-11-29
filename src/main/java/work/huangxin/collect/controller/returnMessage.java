package work.huangxin.collect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import work.huangxin.collect.model.Content;
import work.huangxin.collect.service.ContentService;

import javax.servlet.http.HttpServletResponse;
import java.util.List;


@Controller
public class returnMessage {

    @Autowired
    private ContentService contentService;


    @GetMapping("/")
    public String returnIndex() {

        return "index";
    }

    @PostMapping("/getNewData")
    @ResponseBody
    public List<Content> getNewData() {
        return contentService.getNewData();
    }

    @PostMapping("/getData/{id}")
    @ResponseBody
    public List<Content> getData(@PathVariable Integer id) {

        return contentService.getData(id);

    }


    @RequestMapping("/save/{message}")
    @ResponseBody
    public Integer saveMessage(@PathVariable String message) {

        Content content = new Content();
        content.setContent(message);
        try {
            contentService.add(content);
        } catch (Exception e) {
            return 400;
        }
        return 200;
    }
}
