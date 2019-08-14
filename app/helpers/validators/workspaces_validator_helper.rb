# frozen_string_literal: true

module Validators
  module WorkspacesValidatorHelper
    def validate_title_not_nil
      folder.title ||= ''
    end
  end
end
