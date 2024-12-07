# frozen_string_literal: true

require "jekyll"

module Jekyll
  class AddClassPlugin
    class << self
      # Add a class to the specified tags in the content
      def add_class_to_tags(content, tag, class_name)
        content.gsub(/<#{tag}([^>]*)>/) do |match|
          if match.include?('class="')
            # Append the new class only if it's not already present
            match.sub(/class="([^"]*)"/) do |class_match|
              existing_classes = class_match.match(/class="([^"]*)"/)[1]
              unless existing_classes.split(" ").include?(class_name)
                %{class="#{existing_classes} #{class_name}"}
              else
                class_match
              end
            end
          else
            # Add a new class attribute
            %{<#{tag}#{$1} class="#{class_name}">}
          end
        end
      end # End of add_class_to_tags

      # Process the content of the document
      def process_content(doc)
        Jekyll.logger.info "AddClassPlugin", "Processing #{doc.relative_path}"

        # Modify the content: Add classes to specific HTML tags
        doc.output = add_class_to_tags(doc.output, "h1", "title")
        doc.output = add_class_to_tags(doc.output, "h2", "subtitle")
        doc.output = add_class_to_tags(doc.output, "p", "text")
        doc.output = add_class_to_tags(doc.output, "a", "link")

        Jekyll.logger.info "AddClassPlugin", "Finished processing #{doc.relative_path}"
      end # End of process_content

      # Check if the document should be processed
      def processable?(doc)
        (doc.is_a?(Jekyll::Page) || doc.write?) && doc.output_ext == ".html"
      end # End of processable?
    end # End of class << self
  end # End of AddClassPlugin
end # End of module Jekyll

# Hook into the Jekyll build process
Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  if Jekyll::AddClassPlugin.processable?(doc)
    Jekyll::AddClassPlugin.process_content(doc)
  end
end # End of Jekyll::Hooks.register
