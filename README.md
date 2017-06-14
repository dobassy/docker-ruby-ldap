docker-ruby-ldap
================
Docker Image for ruby 2.4.1 with LDAP bindings based on Official repository (21bc2bf9).  
[ruby/Dockerfile at 21bc2bf9f98aa749f1bd85d190cf0991dac87fc9 · docker-library/ruby][ruby24]

I checked with Gem of 'activeldap' and 'net-ldap'.


Specification Summary
-------------------
- [ruby 2.4.1][ruby24]
- You should be able to use the same way as an official repository.
- LDAP client included.
- It is assumed to be used for development purpose.

[ruby24]: https://github.com/docker-library/ruby/blob/21bc2bf9f98aa749f1bd85d190cf0991dac87fc9/2.4/Dockerfile "ruby/Dockerfile at 21bc2bf9f98aa749f1bd85d190cf0991dac87fc9 · docker-library/ruby"

Usage
-------------------
- It assumes that the application (such as Rails) is on the local host.  
e.g. `/path/to/your/local/rails-app`
- Within the container, execute in the `/srv/app` directory.  
`bundle exec rails s -b 0.0.0.0 -p 3000`

Sample configuration for Docker Compose:

```
app:
  build: .
  ports:
    - "3000:3000"
  volumes:
    - /path/to/your/local/rails-app:/srv/app
  environment:
    RAILS_ENV: development        # You can overwrite
    http_proxy: http://xxx:8080/  # If you needed...
    https_proxy: http://xxx:8080/
  restart: always
```

Why did I make this
-------------------


Trouble notes
-------------------
### SSL error occurred in `bundle install`

```
Retrying fetcher due to error (2/4): Bundler::Fetcher::CertificateFailureError Could not verify the SSL certificate for https://rubygems.org/.
There is a chance you are experiencing a man-in-the-middle attack, but most likely your system doesn't have the CA certificates needed for verification. For information about OpenSSL certificates, see http://bit.ly/ruby-ssl. To connect without using SSL, edit your Gemfile sources and change 'https' to 'http'
```

### Workaround
It seems that CA files are old.

Fixed with `apt-get install -y libssl-dev` command.
