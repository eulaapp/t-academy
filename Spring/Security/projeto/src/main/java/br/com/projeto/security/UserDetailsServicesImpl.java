package br.com.projeto.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.projeto.models.UserModel;
import br.com.projeto.repositories.UserRepository;

@Service
@Transactional
public class UserDetailsServicesImpl implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        
        UserModel userModel = userRepository.findByUser(username)
        .orElseThrow(() -> new UsernameNotFoundException("Usuário não encontrado"));

        return new User(
            userModel.getUser(),
            userModel.getPassword(), 
            true, 
            true, 
            true, 
            true, 
            userModel.getAuthorities()
        );
    }
    
}
