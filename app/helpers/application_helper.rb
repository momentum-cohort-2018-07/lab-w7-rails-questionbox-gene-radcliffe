
module ApplicationHelper

   
    def published_at(publish_date_time)
      date = Time.now
      total = date - publish_date_time.to_datetime
      
      if total <60 then
        diff = (total / 1.second).round
        message = "seconds ago"
      elsif total > 60 && total <3600
        diff = (total / 1.minute).round
        message = "minutes ago"
      elsif total >3600 && total <86400
        diff = (total / 1.hour).round
        message = "hours ago"
      elsif total >= 86400
        diff = (total / 1.day).round
        message = "days ago"
      end

      if total >172800
        ret = publish_date_time.to_date
      else
        ret = "#{diff}" + message  
      end
    end
    def markdown(text)
        options = {
          filter_html:     true,
          hard_wrap:       true,
          link_attributes: { rel: 'nofollow', target: "_blank" },
          space_after_headers: true,
          fenced_code_blocks: true
        }
    
        extensions = {
          autolink:           true,
          superscript:        true,
          disable_indented_code_blocks: true
        }
    
        renderer = Redcarpet::Render::HTML.new(options)
        markdown = Redcarpet::Markdown.new(renderer, extensions)
    
        markdown.render(text).html_safe
      end
end
