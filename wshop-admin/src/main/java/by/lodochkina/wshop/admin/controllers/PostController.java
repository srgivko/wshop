package by.lodochkina.wshop.admin.controllers;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Post;
import by.lodochkina.wshop.posts.PostService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

import static by.lodochkina.wshop.admin.utils.SecurityUtils.MANAGE_POSTS;

@Slf4j
@Controller
@Secured(MANAGE_POSTS)
public class PostController extends WShopAdminBaseController {

    private static final String VIEW_PREFIX = "posts/";
    private final PostService postService;

    @Autowired
    public PostController(PostService postService) {
        this.postService = postService;
    }

    @Override
    protected String getHeaderTitle() {
        return "Управление постами";
    }

    @GetMapping("/posts")
    public String listProducers(Model model) {
        model.addAttribute("posts", this.postService.getAllPosts());
        return VIEW_PREFIX + "posts";
    }

    @GetMapping({"/posts/new", "/posts/{id}"})
    public String createAndUpdatePostForm(@PathVariable(value = "id", required = false) Long id, Model model) {
        Post post;
        if (id == null) {
            post = new Post();
        } else {
            post = this.postService.findPostById(id).orElseThrow(WShopException::new);
        }
        model.addAttribute("post", post);
        return VIEW_PREFIX + "create_edit_post";
    }

    @PostMapping({"/posts", "/posts/{id}"})
    public String createAndUpdatePost(
            @PathVariable(required = false) Long id,
            @Valid Post post,
            BindingResult result,
            RedirectAttributes redirectAttributes
    ) {
        if (result.hasErrors()) {
            return VIEW_PREFIX + "create_edit_post";
        }
        Post persistedPost;
        if (id == null) {
            persistedPost = this.postService.createPost(post);
            log.debug("Created new post with id : {} and name : {}", persistedPost.getId(), persistedPost.getTitle());
            redirectAttributes.addFlashAttribute("info", "Post created successfully");
        } else {
            persistedPost = this.postService.updatePost(post);
            log.debug("Updated new post with id : {} and name : {}", persistedPost.getId(), persistedPost.getTitle());
            redirectAttributes.addFlashAttribute("info", "Post updated successfully");
        }
        return "redirect:/posts";
    }

}
