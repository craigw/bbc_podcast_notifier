module BBC
  class Podcast
    attr_accessor :content, :subtitle, :summary, :description, :title,
     :duration, :pubdate, :enclosure, :medium, :type, :url, :author, 
     :expression, :filesize, :keywords

    class << self
      def find_all
        podcast_xml = proxy.start('downloads.bbc.co.uk') { |bbc|
          bbc.get('/podcasts/latest_episodes.xml').body
        }
        podcast_document = Hpricot(podcast_xml)
        podcasts = (podcast_document / "item").map { |fragment|
          podcast = Hash.from_xml(fragment.to_s)["item"]
          podcast = HashWithIndifferentAccess.new(podcast)
          podcast.delete(:content).each_pair do |key, value|
             podcast[key] = value
           end
          podcast[:pubdate] = begin
            Time.parse(podcast[:pubdate])
          rescue
            nil
          end
          new podcast
        }
      end
      
      private
      def proxy
        Net::HTTP::Proxy('www-cache.reith.bbc.co.uk', 80)
      end
    end

    def initialize(options = {})
      options.each_pair do |key, value|
        if respond_to?("#{key}=")
          send("#{key}=", value)
        end
      end
    end
    
    def id
      Digest::SHA1.hexdigest(url + pubdate.to_s)
    end
    
    def to_yaml
      to_hash.to_yaml
    end

    def to_hash
      returning({}) do |hash|
        instance_variables.each do |var|
          accessor = var[1..-1]
          if respond_to?(accessor)
            hash[accessor] = send(accessor)
          end
        end
        hash[:id] = id
      end
    end
  end
end