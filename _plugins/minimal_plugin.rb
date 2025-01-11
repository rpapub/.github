# frozen_string_literal: true

require "jekyll"

module Jekyll
  class MinimalPlugin
    class << self
      # Process the content of the document
      def process_content(doc)
        # Example: Add a custom message at the end of the document's output
        doc.output += "\n<!-- Processed by MinimalPlugin -->"
      end

      # Check if the document should be processed
      def processable?(doc)
        (doc.is_a?(Jekyll::Page) || doc.write?) && doc.output_ext == ".html"
      end
    end
  end
end

# Hook into the Jekyll build process
Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  if Jekyll::MinimalPlugin.processable?(doc)
    Jekyll::MinimalPlugin.process_content(doc)
  end
end
