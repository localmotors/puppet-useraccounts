# == Class: useraccounts
#
# This class provides the "usersetup" defined type which allows you to easily setup user accounts with associated SSH keys. When used with
# Hiera you can simplify the setup of user accounts.
#
# === Parameters
# This class has no parameters.
#
# === Variables
#
# There are no variables for this class.
#
# === Examples
#
# ==== With Hiera
# class profiles::techusers {
#   $techusers = hiera('techusers')
#   $defaults  = {
#     groups => ['sudo'],
#   }
#   create_resources(useraccounts::usersetup,$techusers,$defaults)
# }
#
# ==== Without Hiera
# class profiles::supportusers {
#   useraccounts::usersetup { 'user1':
#     ensure   => 'present',
#     password => '$6$FAUAeOEiVBQ$6RWQyt42bZpf/06.YGvK1DDksD.dIMflfdfYNaRu7BE1aA7jTtdWliyLQZ3k7tN3bVfcrKvOaRKzsiI4BRjFa1',
#     groups   => ['itusers','support'],
#     needkey  => true,
#     sshkey   => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDAtRKIbLVNQcAHghRRzad2G8Y7HgjySflYKpPvQnloUAMptvg5tqpJcWCVNMauKbr40OxHEF9Utr9CzYa/ZkBLfnZS1LPARtGuRfJmewo6T9TEA7fiqLx9deexd0youJsOngRD7RdJFV8WFwFRPPd7ahq2zIp12xw3/6Kpo/ZnsLYlavX+An/DZms82ZeKDL1z5V/4KZ7eKb8Q5K9eZJq5F3pLqMxu6yfOxFC1NbtFT4vWUHTfTt027IgBD9TnrUf2HeWx1R9jZsMQyRAS/4eZWur6ZN+7AaRxws2mGsWbiJA/zPnW5AOR9DBDPzW1/2BUjVgjYEh5k9326+roeIyh',
#     comment  => 'User 1',
#     username => 'user1',
#   }
# }
#
# === Authors
#
# Brandon Haymore <brpacecar@gmail.com>
#
# === Copyright
#
# Copyright 2015 Brandon Haymore, unless otherwise noted.
#
class useraccounts {

}
