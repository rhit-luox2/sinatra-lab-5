# from flask import Blueprint, redirect, render_template, request, send_file
# from io import BytesIO
# from PIL import Image, ImageFilter
# from flask_wtf import FlaskForm
# from wtforms import FileField, SubmitField
#
class SimplePhotoProcessorController < ApplicationController
  get '/simple_photo_processor/new' do
     erb :"simple_photo_processor/new.html"
  end

  post '/simple_photo_processor' do
    # puts "Params are: #{params}"
    if params[:imageUpload]
      input_image = Magick::Image.read(params[:imageUpload][:tempfile].path)[0]
      ## TODO: Actually transform image here, instead of just serving it back to the user
      #        Docs for Rmagick: https://rmagick.github.io/usage.html
      output_image = input_image

      output_image.format = 'png'
      # Return values format is: `[status code, headers, output]`
      # See: https://sinatrarb.com/intro.html#return-values
      [200, {'Content-Type' => 'image/png'}, output_image.to_blob]
    else
      # We should do something here...
      # there's even a bonus test for this...
      return redirect('/simple_photo_processor/new')
    end
  end
end
