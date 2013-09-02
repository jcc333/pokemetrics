require 'fileutils'
require 'tempfile'

class Formatter
  attr_reader:file_path

  def initialize(aFilePath)
    @file_path = aFilePath
  end

  def to_CSV
    temp_file = Tempfile.new('to_CSV_temp')
    File.open(@file_path, 'r') do |file|
      file.each_line do |line|
        temp_file.puts line.split().join(', ')
      end
    end
    temp_file.rewind
    FileUtils.mv(temp_file.path, @file_path)
  ensure
    temp_file.close
    temp_file.unlink
  end

  def get_column_names
    File.open(@file_path).first.split(',')
  end

  def get_column_index(column_name)
    get_column_names().index(column_name)
  end

  def delete_column(column_name)
    column_index = get_column_index(column_name)
    puts("Deleting column #{}, at index #{}.", column_name, column_index)
    temp_file = Tempfile.new('delete_column_temp')
    File.open(@file_path, 'r') do |file|
      file.each_line do |line|
        replacement_line = line.split(',')
        replacement_line.delete_at(column_index)
        temp_file.puts replacement_line.join(',')
      end
      temp_file.rewind
      FileUtils.mv(temp_file.path, @file_path)
    end
  end
end
