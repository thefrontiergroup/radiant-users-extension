module Devise
  module Encryptors
    class Radiant < Base
      def self.digest(password, stretches, salt, pepper)
        str = [password, salt].flatten.compact.join
        Digest::SHA1.hexdigest("--#{salt}--#{password}--")
      end
    end
  end
end