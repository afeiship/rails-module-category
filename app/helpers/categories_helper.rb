module CategoriesHelper

    def tree_inner inNode
        inNode.children.map do |child|
            content_tag :li, class:"cate-depth-#{child.depth}" do
                concat content_tag :span, child.name
                if child.children.any?
                    concat content_tag :ul , tree_inner(child)
                end
            end
        end.join.html_safe
    end

    def tree_view
        content_tag :ul, class:'tree-view-container' do
            Category.roots.map do |root|
                content_tag :li, class:"cate-depth-#{root.depth}" do
                    concat content_tag :span, root.name
                    concat content_tag :ul, tree_inner(root)
                end
            end.join.html_safe
        end
    end
    
end
