# Key features of inspo_meme.png:
# Layout: left size text and right size images
# Text: Bold, Normal font

library(magick)

#image part
after_gym_url <-"https://ih1.redbubble.net/image.5312849102.3231/st,small,507x507-pad,600x600,f8f8f8.jpg"
before_gym_url <- "https://i.ebayimg.com/images/g/R8UAAOSwcu5irXAs/s-l1600.jpg"

before_gym <- image_read(before_gym_url)%>%
  image_scale(250)

after_gym <- image_read(after_gym_url)%>%
  image_scale(250)

#Text part
before_text <- image_blank(width = 250, height = 250, color = "#ffffff") %>%
  image_annotate(text = "before you go to gym \nin winter",
                 color = "#000000",
                 size = 20, font = "Impact",
                 gravity = "center")

after_text <- image_blank(width = 250, height = 250, color = "#ffffff") %>%
  image_annotate(text = "once you finish workout \nin winter",
                 color = "#000000", font = "Impact",
                 size = 20, gravity = "center")

#presentation part
top <- image_append(c(before_gym, before_text))
bottom <- image_append(c(after_gym, after_text))

#Gathering them
second_slide <- c(top, bottom) %>%
  image_append(stack=TRUE) %>%
  image_scale(250)

# image_write(final, "my_meme.png")

# Animatate
first_slide <- image_blank(width = 250, height = 250, color = "#000000")%>%
  image_annotate("🥶Uni Students Daily", color = "#ffffff", font = "Impact",
                 size = 20, gravity = "center")

# third slide
third_slide <- image_blank(width = 250, height = 250, color = "#000000")%>%
  image_annotate("📍Outside gym", color = "#ffffff", font = "Impact",
                 size = 20, gravity = "center")

#fourth_slide
hotdog_sus_pic <- image_read("https://media.tenor.com/Nfct9RreQfUAAAAe/dog-meme.png")%>%
  image_scale("130x130")

me <- image_blank(width = 250, height = 75, color = "#ffffff") %>%
  image_annotate(text = "bro: let's have some bubble tea🧋",
                 color = "#000000",
                 size = 20, font = "Impact")

bro <- image_blank(width = 250, height = 75, color = "#ffffff") %>%
  image_annotate(text = "me: ",
                 color = "#000000",
                 size = 20, font = "Impact")
gathering <- c(me, bro, hotdog_sus_pic)%>%
  image_append(stack = TRUE)
# print(gathering)
  
# summarize annimation
frames <- c(first_slide, second_slide, third_slide, gathering)
final_work <- image_animate(frames, fps = 1, loop = 1)%>%
  image_scale(250)

#image_write(final_work, "my_animation.gif")
