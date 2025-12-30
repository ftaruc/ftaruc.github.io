#!/usr/bin/env ruby
# Script to generate photos.yml from images/photos page/{project} folders

require 'yaml'
require 'fileutils'

# Try to load exifr for EXIF data extraction
begin
  require 'exifr/jpeg'
  EXIFR_AVAILABLE = true
rescue LoadError
  EXIFR_AVAILABLE = false
  puts "Warning: exifr gem not available. Using file modification time for timestamps."
end

photos_dir = File.join(__dir__, 'images', 'photos page')
photos_data = []

# Load existing photos.yml to preserve manual notes
existing_photos = {}
existing_file = File.join(__dir__, '_data', 'photos.yml')
if File.exist?(existing_file)
  begin
    existing_data = YAML.load_file(existing_file)
    if existing_data.is_a?(Array)
      existing_data.each do |photo|
        existing_photos[photo['code']] = photo['notes'] if photo['code'] && photo['notes'] && !photo['notes'].empty?
      end
    end
  rescue => e
    puts "Warning: Could not load existing photos.yml: #{e.message}"
  end
end

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
      
      # Extract timestamp from EXIF or file modification time
      timestamp = nil
      if EXIFR_AVAILABLE && (filename.downcase.end_with?('.jpg') || filename.downcase.end_with?('.jpeg'))
        begin
          exif = EXIFR::JPEG.new(image_path)
          timestamp = exif.date_time_original || exif.date_time || exif.modify_date
        rescue => e
          # Fall back to file modification time if EXIF fails
          timestamp = File.mtime(image_path)
        end
      else
        # Use file modification time
        timestamp = File.mtime(image_path)
      end
      
      # Format timestamp as string (YYYY-MM-DD HH:MM:SS)
      timestamp_str = timestamp ? timestamp.strftime('%Y-%m-%d %H:%M:%S') : ''
      
      photo_code = "#{project_name}-#{sprintf('%04d', index + 1)}"
      
      photo_entry = {
        'code' => photo_code,
        'title' => filename_no_ext,
        'timestamp' => timestamp_str,
        'notes' => existing_photos[photo_code] || '',
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

