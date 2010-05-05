class YouTubeG
  module Model
    class Comment < YouTubeG::Record
      # *Time*:: When the video was published on Youtube.
      attr_reader :published_at
      
      # *Time*:: When the video's data was last updated.
      attr_reader :updated_at
      
      # *String*:: Title for the video.
      attr_reader :title
      
      # *String*:: Description of the video.
      attr_reader :content
      
      # YouTubeG::Model::Author:: Information about the YouTube user who owns a piece of video content.
      attr_reader :author      
    end
  end
end
