package by.lodochkina.wshop.site.controllers;

import by.lodochkina.wshop.entities.Post;
import by.lodochkina.wshop.posts.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class PostController extends WShopSiteBaseController{

    private final PostService postService;

    @Autowired
    public PostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/posts/{id}")
    public String post(@PathVariable("id") Post post, Model model) {
        model.addAttribute("post", post);
        return "post";
    }

    @GetMapping("/posts")
    public String allPosts(@PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable, Model model) {
        model.addAttribute("postPage", this.postService.getAllPosts(pageable));
        return "posts";
    }

    @Override
    protected String getHeaderTitle() {
        return "Новости";
    }
    
}
