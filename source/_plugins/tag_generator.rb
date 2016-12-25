# https://github.com/danieldevries/jekyll-tag-generator
module Jekyll
  # Base class for the tag pages with all the shared behaviour
  class BaseTagPage < Page
    def initialize(site, base, dir, name)
      @site = site
      @base = base
      @dir = dir
      @name = name
      self.process @name
      self.read_yaml File.join(base, '_layouts'), layout_page
    end

    # Implement this function in child classes
    # Expected to return a string containing the filename of the layout in _layouts
    def layout_page
      raise
    end
  end

  # Represents a specific tag page
  class TagPage < BaseTagPage
    def initialize(site, base, dir, tag)
      super(site, base, dir, 'index.html')
      self.data['tag'] = tag
    end

    def layout_page
      'tag_page.html'
    end
  end

  # Generate a page for every tag
  class TagPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.has_key? 'tag_page'
        dir = site.config['tag_page_dir'] || 'tag'
        site.tags.keys.each do |tag|
          write_tag_page(site, File.join(dir, tag), tag)
        end
      end
    end

    private

    def write_tag_page(site, dir, tag)
      page = TagPage.new(site, site.source, dir, tag)
      page.render(site.layouts, site.site_payload)
      page.write(site.dest)
      site.pages << page
    end
  end

  # Represents a page with all the tags
  class TagIndexPage < BaseTagPage
    def layout_page
      'tag_index.html'
    end
  end

  # Generates a page with all tags
  class TagIndexGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.has_key? 'tag_index'
        write_tag_index(site)
      end
    end

    private

    def write_tag_index(site)
      page = TagIndexPage.new(site, site.source, 'tags', 'index.html')
      page.render(site.layouts, site.site_payload)
      page.write(site.dest)
      site.pages << page
    end
  end

  # RSS feed with posts from all tags
  class RssIndexPage < BaseTagPage
    def layout_page
      'rss_index.xml'
    end
  end

  # Generates /rss.xml
  class RssIndexGenerator < Generator
    safe true

    def generate(site)
      page = RssIndexPage.new(site, site.source, '', 'rss.xml')
      page.render(site.layouts, site.site_payload)
      page.write(site.dest)
      site.pages << page
    end
  end
end
