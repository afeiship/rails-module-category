module CategoriesHelper

    def tree_view inNode
        inNode.children.map do |child|
            content_tag :li do |a,b|
                if child.children.any?
                    tree_view(child)
                end
                child.name
            end
        end.join.html_safe
    end

end


#   def display_segment( node )
    
#     html = "<li>"
#     node_class = node.children.length == 0 ? "file" : "folder"
#     html << "<span class=\"#{node_class}\">#{h(node.to_s)} </span>"
#     html << "<ul id=\"children_of_#{h(node.sid)}\">"
#     node.children.each{|child_node|
      
#       html << display_segment( child_node )
#     }
#     html << "</ul></li>"
#   end

# a1 = Category.find_by_id 1
# a2 = Category.find_by_id 2
# a3 = Category.find_by_id 3
# SELECT "categories".* FROM "categories" WHERE "categories"."parent_id" = 1