module Jekyll

  class TagList < Page
    def initialize(site, base, dir)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tags_folder_index.html')
    end
  end

  class TagListGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'tags_folder_index'
        site.pages << TagList.new(site, site.source, 'tags')
      end
    end
  end
end
