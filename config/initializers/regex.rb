#This file holds common REGEX expressions that may be used throughout
#the ez_jwt engine


VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

VALID_PWD_REGEX = /\A
    (?=.{8,})           #At least 8 characters long
    (?=.*\d)            #At least 1 number
    (?=.*[a-z])         #At least one lowercase letter
    (?=.*[A-Z])         #At least one uppercase letter
    (?=.*[[:^alnum:]])  #At least one symbol
  /x
