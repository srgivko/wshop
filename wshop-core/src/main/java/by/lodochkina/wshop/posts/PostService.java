package by.lodochkina.wshop.posts;

import by.lodochkina.wshop.entities.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface PostService {

    Page<Post> getAllPosts(Pageable pageable);

    Optional<Post> findPostById(Long id);

    Post createPost(Post post);

    Post updatePost(Post post);

    List<Post> getAllPosts();
}
