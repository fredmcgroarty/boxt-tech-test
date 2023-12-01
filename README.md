# ROBOT APP - Tech test for BOXT

* author: fred mac 
* email: freddymcgroarty@gmail.com

## Usage

I used ruby 3.2 via alpine docker image.  

* Build the image: `docker build --tag 'boxt-tech-test' .`
* Run tests: `docker run --name boxt-tech-test-1 -it -v ./:/home/app/ boxt-tech-test bundle exec rspec /home/app/`


```
         _______
       _/       \_
      / |       | \
     /  |__   __|  \
    |__/((o| |o))\__|
    |      | |      |
    |\     |_|     /|
    | \           / |
     \| /  ___  \ |/
      \ | / _ \ | /
       \_________/
        _|_____|_
   ____|_________|____
  /                   \ 
```

