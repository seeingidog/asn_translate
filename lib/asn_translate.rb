require 'redis'
R = Redis.new

class ASNTranslate

  #
  # Parse ASN flat text file
  def build_list
    @asns = {}
    File.open("./asn.txt").each { |line|
      begin
        fixedline = line.split("\t")
        @asns.merge!({fixedline[0] => fixedline[1].strip})
      rescue
        puts "parse error"
      end
    }
    return @asns
  end

  #
  # Add to Redis
  def add_db
    R['asn_list'] = "yes"
    build_list.each do |k,v|
      R[k] = v
    end
  end

  #
  # Search database for key, return String result
  def self.translate_asn(asn)
    if R['asn_list'] == nil
      add_db
    end
    return R[asn.to_s]
  end
  
end
