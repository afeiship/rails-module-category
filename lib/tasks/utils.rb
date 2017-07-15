module Utils
    class CreateCate
        def initialize
            @counter = 0;
        end

        def render (nodes,parent_id)
            nodes.each_with_index do |node,index|
                @counter = @counter + 1
                Category.create(
                    id: @counter,
                    parent_id: parent_id,
                    name: node[:name],
                    description: node[:description]
                )

                if node[:children]
                    render( node[:children] ,@counter)
                end
            end
        end
    end
end