# encoding: utf-8
require "logstash/logging/logger"
require "logstash/namespace"

module LogStash module Util
  module Loggable
    def self.included(klass)
      def klass.logger
        name = self.name.gsub('::', '.').downcase
        @logger ||= LogStash::Logging::Logger.new(name)
      end
    end

    def logger
      self.class.logger
    end
  end
end; end
