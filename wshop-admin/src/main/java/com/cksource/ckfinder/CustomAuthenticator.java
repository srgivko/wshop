package com.cksource.ckfinder;

import com.cksource.ckfinder.authentication.Authenticator;
import com.cksource.ckfinder.config.Config;

import javax.inject.Inject;
import javax.inject.Named;

@Named
public class CustomAuthenticator implements Authenticator {

    @Override
    public boolean authenticate() {
        return true;
    }
}