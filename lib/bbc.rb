$:.unshift File.dirname(__FILE__)
$:.unshift File.dirname(__FILE__) + '/../vendor/gems/smqueue/lib'

require 'rubygems'
require 'hpricot'
require 'activesupport'
require 'smqueue'
require 'net/http'
require 'digest/sha1'
require 'bbc/podcast'