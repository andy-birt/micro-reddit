# README

Uses ruby 2.6.1

Simualtes the logic of a user making a post and other users making comments on the post. 

Feel free to test however you like.

```console
$ git clone https://github.com/Pstyne/micro-reddit.git
$ cd micro-reddit
$ bundle install
$ rails db:migrate
$ rails console
Running via Spring preloader in process 21660
Loading development environment (Rails 5.2.4.1)
irb(main):001:0> u = User.new(name: "bob", email: "bob@bomb.com", password: "booboo", password_confirmation: "booboo")
```

Getting errors? Try this:

>/micro-reddit/.ruby-version

Replace `2.6.1` with your version

As well as changing ruby version in gem file then continue from `bundle install`



