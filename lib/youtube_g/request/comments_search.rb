class YouTubeG
  module Request #:nodoc:  
    class CommentsSearch < BaseSearch #:nodoc:      
      attr_reader :max_results                     # max_results
      attr_reader :offset                          # start-index

      def initialize(video_id, options={})
        @max_results, @order_by, @offset = nil
        @url = base_url

        @url << "videos/#{video_id}/comments"
        set_instance_variables(options)

        if options.has_key?(:per_page)
          @max_results = options[:per_page]
        end
        
        if options.has_key?(:page)
          per_page = @max_results || 25
          @offset = calculate_offset(options[:page], per_page)
        end
        
        @url << build_query_params(to_youtube_params)
      end

      private

      def to_youtube_params
        {
          'max-results' => @max_results,
          'start-index' => @offset
        }
      end
    private
      def calculate_offset(page, per_page)
        page == 1 ? 1 : ((per_page * page) - per_page + 1)
      end
    end
    
  end
end