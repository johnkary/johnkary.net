module Jekyll
  module AssetFilter
    def description_break(s)
      s.gsub(/\n/, '<br><br>')
    end

    def time_rfc2822(time)
      time.rfc2822
    end

    # Hacky way to render list of tags as HTML because Jekyll doesn't easily
    # allow sorting. So this method sorts the tags before rendering them
    def render_tags_list(tags)
      sorted_tags = tags.keys.sort_by! { |tag| tag.downcase }

      str = ''
      sorted_tags.each { |tag|
        str << '<li>' + tags[tag].size.to_s + ' - <a href="/tag/' + tag + '">' + tag + '</a></li>'
      }

      str
    end
  end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)
