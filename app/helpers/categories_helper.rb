module CategoriesHelper

    def tree_view inNode
        inNode.children.map do |child|
            content_tag :li do
                concat content_tag :span, child.name
                if child.children.any?
                    concat content_tag :ul , tree_view(child), class:"sub-cate-depth-#{child.depth}"
                end
            end
        end.join.html_safe
    end

end
