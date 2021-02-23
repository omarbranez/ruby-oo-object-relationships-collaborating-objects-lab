class MP3Importer
    attr_accessor :files
    attr_reader :path
   
    def initialize(path)
        @path = path
        @files = files
    end

    def files
        files = Dir.glob("#{path}/*.mp3").collect {|filename| filename.gsub("#{path}/", "")} #do we need the ||=?
        #Dir.glob("name of path/wildcard.filetype")
        #Dir.glob finds all files of the given filetype in the given path.
        #Return an array after replacing the path name with "" (nothing) with gsub. gsub(pattern, what to substitute that pattern with)
    end

    def import
        files.each do |songfiles| Song.new_by_filename(songfiles)
        end
    end
        


end