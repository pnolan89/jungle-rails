class Admin::AdminController < ApplicationController
  http_basic_authenticate_with :name => ENV['HBA_NAME'], :password => ENV['HBA_PASSWORD']
end
