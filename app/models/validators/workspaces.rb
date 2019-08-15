# frozen_string_literal: true

module Validators
  class Workspaces < Base
    include WorkspacesValidatorHelper

    def initialize(fields)
      @fields = fields
    end

    def validate(workspace)
      @workspace = workspace

      fields.each { |field| send(field) }
    end

    private

    attr_reader :fields, :workspace

    def title
      # this method sets title to '' if it's nil
      validate_title_not_nil
    end
  end
end
