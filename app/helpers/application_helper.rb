module ApplicationHelper
    def flash_message
        turbo_stream.prepend "flash", partial: "layouts/flash"
    end
end
