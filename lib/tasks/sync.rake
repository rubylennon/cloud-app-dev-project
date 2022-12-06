namespace :sync do
  task feeds: [:environment] do
    Feed.all.each do |feed|
      xml = HTTParty.get(feed.url).body # Updated for Feedjira v3.0
      p xml
      content = Feedjira.parse(xml)
      content.entries.each do |entry|
        p "Synced Entry - #{entry.title}, #{entry.author}, ##{entry.url}, #{entry.published}"
        local_entry = feed.entries.create(title: entry.title, content: entry.summary, author: entry.author, url: entry.url, published: entry.published)
        p local_entry
      end
      p "Synced Feed - #{feed.name}"
    end
  end
end