#!/usr/bin/env ruby
# Script to generate photos.yml from images/photos page/{project} folders

require 'yaml'
require 'fileutils'

photos_dir = File.join(__dir__, 'images', 'photos page')
photos_data = []

# Get all project folders
if Dir.exist?(photos_dir)
  Dir.glob(File.join(photos_dir, '*')).select { |f| File.directory?(f) }.each do |project_dir|
    project_name = File.basename(project_dir)
    
    # Get all image files in the project folder
    image_extensions = %w[.jpg .jpeg .png .gif .JPG .JPEG .PNG .GIF]
    images = Dir.glob(File.join(project_dir, '*')).select do |f|
      image_extensions.any? { |ext| f.end_with?(ext) }
    end.sort
    
    # Add each image to the photos data
    images.each_with_index do |image_path, index|
      filename = File.basename(image_path)
      filename_no_ext = File.basename(image_path, File.extname(image_path))
      
      photo_entry = {
        'code' => "#{project_name}-#{sprintf('%04d', index + 1)}",
        'title' => filename_no_ext,
        'notes' => '',
        'image' => "/images/photos page/#{project_name}/#{filename}"
      }
      
      photos_data << photo_entry
    end
  end
end

# Write to photos.yml
output_file = File.join(__dir__, '_data', 'photos.yml')
FileUtils.mkdir_p(File.dirname(output_file))

File.open(output_file, 'w') do |f|
  f.write("# Photo gallery data\n")
  f.write("# Auto-generated from images/photos page/{project} folders\n")
  f.write("# Run: ruby generate_photos_data.rb\n\n")
  f.write(photos_data.to_yaml)
end

puts "Generated #{photos_data.length} photo entries in #{output_file}"

