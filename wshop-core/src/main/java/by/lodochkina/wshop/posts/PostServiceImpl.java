package by.lodochkina.wshop.posts;

import by.lodochkina.wshop.WShopException;
import by.lodochkina.wshop.entities.Post;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PostServiceImpl implements PostService {

    private final PostRepository postRepository;

    @Autowired
    public PostServiceImpl(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    @Override
    public Page<Post> getAllPosts(Pageable pageable) {
        return this.postRepository.findAll(pageable);
    }

    @Override
    public Optional<Post> findPostById(Long id) {
        return this.postRepository.findById(id);
    }

    @Override
    public Post createPost(Post post) {
        return this.postRepository.save(post);
    }

    @Override
    public Post updatePost(Post post) {
        Optional<Post> persistedPost = this.postRepository.findById(post.getId());
        if (!persistedPost.isPresent()) {
            throw new WShopException("Post " + post.getId() + " doesn't exist");
        }
        BeanUtils.copyProperties(post, persistedPost.get(), "id");
        return this.postRepository.save(persistedPost.get());
    }

    @Override
    public List<Post> getAllPosts() {
        return this.postRepository.findAll();
    }
}
