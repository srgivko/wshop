package com.cksource.ckfinder;

import com.cksource.ckfinder.authentication.Authenticator;

import javax.inject.Named;

@Named
public class CustomAuthenticator implements Authenticator {

    @Override
    public boolean authenticate() {
        return true;
    }
}