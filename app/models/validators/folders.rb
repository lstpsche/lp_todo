# frozen_string_literal: true

module Validators
  class Folders < Base
    include FoldersValidatorHelper

    def initialize(fields)
      @fields = fields
    end

    def validate(folder)
      @folder = folder

      fields.each { |field| send(field) }
    end

    private

    attr_reader :fields, :folder

    def title
      # this method sets title to '' if it's nil
      validate_title_not_nil
    end

    def workspace
      check_workspace_presence
    end
  end
end
