require 'fileutils'
require 'tempfile'

class Formatter
  attr_reader:filePath

  def initialize(aFilePath)
    @filePath = aFilePath
  end

  def toCSV
    temp_file = Tempfile.new('foo')
    File.open(@filePath, 'r') do |file|
      file.each_line do |line|
        temp_file.puts line.split().join(', ')
      end
    end
    temp_file.rewind
    FileUtils.mv(temp_file.path, @filePath)
  ensure
    temp_file.close
    temp_file.unlink
  end
end
