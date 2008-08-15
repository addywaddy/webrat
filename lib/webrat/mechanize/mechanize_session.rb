module Webrat
  class MechanizeSession < Session
    
    def initialize(mechanize = WWW::Mechanize.new)
      @mechanize = mechanize
    end
    
    def get(url, data)
      @mechanize_page = @mechanize.get(url, data)
    end

    def post(url, data)
      data = data.flatten!
      @mechanize_page = @mechanize.post(url, data)
    end

    def response_body
      @mechanize_page.content
    end

    def response_code
      @mechanize_page.code.to_i
    end
      
  end
end

class Hash
  def flatten!
    self.each_pair do |k,v|
      if v.kind_of?(Hash)
        v.keys.each do |v_k|
          self["#{k}[#{v_k}]"] = v[v_k]
          self.delete(k)
        end
      end
    end
  end
end