class Color_Text
   def self.colorize(text, color_code)
     "\e[#{color_code}m#{text}\e[0m"
   end
   
   def self.change_color(text, color)
      case color.downcase
       when "red"
         colorize(text, 31)
         return text
         
       when "green"
         colorize(text, 32)
       
       when "yellow"
         colorize(text, 33)
       
       when "blue"
         colorize(text, 34)
       
       when "pink"
         colorize(text, 35)
       
       when "cyan"
         colorize(text, 36)
       
       when "grey"
         colorize(text, 37)
         
       when "black"
         colorize(text, 38)
         
       when "bg_black"
         colorize(text, 40)
         
       when "bg_red"
          colorize(text, 41)

       when "bg_green"
          colorize(text, 42)

       when "bg_yellow"
          colorize(text, 43)

       when "bg_blue"
          colorize(text, 44)

       when "bg_pink"
          colorize(text, 45)

       when "bg_cyan"
          colorize(text, 46)

       when "bg_grey"
          colorize(text, 47)                      
      end
   end 
end