class ApplicationService
  require 'faraday'
  require 'json'
  require 'ostruct'
  require 'date'

  def self.call(*args, **kwargs)
    new(*args, **kwargs).call
  end

  def call
    raise NotImplementedError
  end

  class Success
    attr_reader :result

    def initialize(result: nil)
      @result = result
    end

    def success?
      true
    end

    def failure?
      !success?
    end
  end

  class Failure
    attr_reader :error, :result

    def initialize(error:, result: nil)
      @error = error
      @result = result
    end

    def success?
      false
    end

    def failure?
      !success?
    end
  end

  class Error < StandardError
  end
end
