module Script
  module FileWriter
    
    def self.write_flex_token(token, path=nil)
      File.write(path || ENV['FLEX_TOKEN_FILE'], flex_token_file(token))
    end
    
    def self.flex_token_file(token)
      "package com.carecloud\n{\n\tpublic class TokenClass\n\t{\n\t\tpublic static const TOKEN:String = \"#{token}\";\n\t\tpublic static const REFRESH_TOKEN:String = \"\";\n\n\t\tpublic function TokenClass()\n\t\t{\n\t\t}\n\t}\n}"
    end
    
  end
end