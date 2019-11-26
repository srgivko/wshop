package by.lodochkina.wshop.posts;

import by.lodochkina.wshop.entities.Post;

import java.util.List;
import java.util.Optional;

public interface PostService {
    List<Post> getAllPosts();

    Optional<Post> findPostById(Long id);

    Post createPost(Post post);

    Post updatePost(Post post);
}
